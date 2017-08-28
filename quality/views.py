from django.shortcuts import render
from django.db.models import Count
from datetime import datetime, timedelta

from . import models

class SummaryProject(object):
	def __init__(self, project, closed, opened):
		self.project = project
		self.closed = closed
		self.opened = opened

class SummaryStatus(object):
	def __init__(self, status, issues, porcentaje):
		self.status = status
		self.issues = issues
		self.porcentaje = porcentaje

class TrackIssue(object):
	def __init__(self, date, created, closed):
		self.date = date
		self.created = created
		self.closed = closed

def index(request):
	customers = models.Customer.objects.all()
	context = {'customers': customers}
	return render(request, 'quality/index.html', context)


def projects(request, customer_id):
	customer = models.Customer.objects.get(pk=customer_id)
	projects = models.Project.objects.filter(customer=customer_id)
	stats = []
	for p in projects:
		stats.append(SummaryProject(p.name, 0, 0))
	closed = models.Issue.objects.filter(project__customer_id=customer_id).filter(resolution__isnull=False).values('project__name').annotate(count=Count('id'))
	opened = models.Issue.objects.filter(project__customer_id=customer_id).filter(resolution__isnull=True).values('project__name').annotate(count=Count('id'))
	for p in stats:
		for m in closed:
			if m['project__name'] == p.project:
				p.closed = m['count']
				break
		for m in opened:
			if m['project__name'] == p.project:
				p.opened = m['count']
				break
	context = {'customer':customer, 'projects':projects, 'stats':stats}
	return render(request, 'quality/projects.html', context)

def detail(request, customer_id, project_id):
	customer = models.Customer.objects.get(pk=customer_id)
	project = models.Project.objects.get(pk=project_id)
	total = models.Issue.objects.filter(project=project_id).aggregate(total=Count('id'))
	statuses = models.Issue.objects.filter(project=project_id).values('status__description').annotate(count_issues=Count('status'))
	summary = []
	for row in statuses:
		summary.append(SummaryStatus(row['status__description'], row['count_issues'], row['count_issues'] / total['total']))
	if len(summary) == 0:
		summary.append(SummaryStatus('', 0, 0))
	created = models.Issue.objects.filter(project=project_id).values('created').annotate(count=Count('id')).order_by('created')	
	closed = models.Issue.objects.filter(project=project_id).filter(closed__isnull=False).values('closed').annotate(count=Count('id')).order_by('created')	
	tracks = []
	if len(created) > 0:
		dates = []
		current = created[0]['created']
		last = created[len(created) - 1]['created']
		while current <= last:
			dates.append(current)
			current = current + timedelta(days=1)		
		for date in dates:
			total_opened = 0
			total_closed = 0
			track = TrackIssue(date, total_opened, total_opened)
			for opened in created:
				if opened['created'] <= date:
					total_opened += opened['count']
			for close in closed:
				if close['closed'] <= date:
					total_closed += close['count']
			track.created = total_opened
			track.closed = total_closed
			tracks.append(track)
	if len(tracks) == 0:
		tracks.append(TrackIssue(datetime.now(), 0, 0))
	priorities = models.Issue.objects.filter(project=project_id).filter(closed__isnull=True).values('priority__description').annotate(count=Count('priority')).order_by('priority__id')
	if len(priorities) == 0:
		priorities = [{'priority__description':'','count':0}]
	assignees = models.Issue.objects.filter(project=project_id).filter(closed__isnull=True).values('assignee__name').annotate(count=Count('assignee')).order_by('assignee__id')
	if len(assignees) == 0:
		assignees = [{'assignee__name':'','count':0}]
	context = {'customer': customer, 'project':project, 'summary':summary, 'tracks':tracks, 'priorities':priorities, 'assignees':assignees}
	return render(request, 'quality/detail.html', context)