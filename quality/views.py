#coding=utf-8
from django.shortcuts import render
from django.db.models import Count
from datetime import datetime, timedelta
from django.http import HttpResponseRedirect, JsonResponse
from django.db import connection
from django.contrib.auth.decorators import login_required

from threading import Thread

from . import models
from . import forms

import csv
import shutil
import codecs

UPLOAD_PATH = 'C:/uploads/';

COMMA = ','

NUM_TOKENS = 19

class IssueRow(object):

    def __init__(self, tokens):
        idx = 0
        self.id = tokens[idx]
        idx += 1
        self.project = tokens[idx]
        idx += 1
        self.informer = tokens[idx]
        idx += 1
        self.assignee = tokens[idx]
        idx += 1
        self.priority = tokens[idx]
        idx += 1
        self.severity = tokens[idx]
        idx += 1
        self.repro = tokens[idx]
        idx += 1
        self.version = tokens[idx]
        idx += 1
        self.category = tokens[idx]
        idx += 1
        self.creation = tokens[idx]
        idx += 1
        self.os = tokens[idx]
        idx += 1
        self.os_version = tokens[idx]
        idx += 1
        self.platform = tokens[idx]
        idx += 1
        self.visibility = tokens[idx]
        idx += 1
        self.modification = tokens[idx]
        idx += 1
        self.resume = tokens[idx]
        idx += 1
        self.status = tokens[idx]
        idx += 1
        self.resolution = tokens[idx]
        idx += 1
        self.solve = tokens[idx]
        idx += 1


def parse(file_csv):
    rows = []
    with codecs.open(file_csv, encoding="latin1", mode="r+") as source:
        is_first = True        
        for line in source:
            if is_first:
                is_first = False
            else:
                line = line.strip()
                if line[0] == '"':
                    line = line[1:]
                if line[-1] == '\t':
                    line = line[:-1]
                if line[-1] == '"':
                    line = line[:-1]
                if line[-1] == '\'':
                    line = line[:-2]
                tokens = line.split(COMMA)
                if len(tokens) == NUM_TOKENS:
                    rows.append(IssueRow(tokens))
                else:
                    tokens_left = tokens[0:15]
                    tokens_right = [u'', tokens[-3], tokens[-2], tokens[-1]]
                    rows.append(IssueRow(tokens_left + tokens_right))
    return rows

def call_process_issues(process_id):
	with connection.cursor() as cursor:			
		cursor.callproc('process_issues', [process_id])

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
	closed = models.Issue.objects.filter(project__customer_id=customer_id).filter(closed__isnull=False).values('project__name').annotate(count=Count('id'))
	opened = models.Issue.objects.filter(project__customer_id=customer_id).filter(closed__isnull=True).values('project__name').annotate(count=Count('id'))
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
	statuses = models.Issue.objects.filter(project=project_id, closed__isnull=True).values('status__description').annotate(count_issues=Count('status'))
	summary = []
	for row in statuses:
		summary.append(SummaryStatus(row['status__description'], row['count_issues'], float(row['count_issues']) / total['total']))
	if len(summary) == 0:
		summary.append(SummaryStatus('', 0, 0))
	created = models.Issue.objects.filter(project=project_id).values('created').annotate(count=Count('id')).order_by('created')	
	closed = models.Issue.objects.filter(project=project_id).filter(closed__isnull=False).values('closed').annotate(count=Count('id')).order_by('closed')	
	tracks = []
	if len(created) > 0:
		dates = []
		current = created[0]['created']
		last = created[len(created)-1]['created']
		if len(closed) > 0 and closed[len(closed) - 1]['closed'] > created[len(created)-1]['created']:
			last = closed[len(closed) - 1]['closed']
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

@login_required
def import_csv(request):
	if request.method == 'POST':
		form = forms.UploadCsvForm(request.POST, request.FILES)
		if form.is_valid():
			f = request.FILES['file']
			path = UPLOAD_PATH + f.name
			with open(path, 'wb+') as destination:
				for chunk in f.chunks():
					destination.write(chunk)
			issueProcess = models.IssueProcess()
			issueProcess.file = f.name
			issueProcess.source = form.cleaned_data['origen']
			issueProcess.dateLoaded = datetime.now()
			issueProcess.save()
			return HttpResponseRedirect('step2')
	else:
		form = forms.UploadCsvForm()
		return render(request, 'quality/step1.html', {'form':form})

@login_required
def load_csv(request):
	if request.method == 'POST':
		form = forms.ProcessCvsForm(request.POST)
		if form.is_valid():
			issueProcess = models.IssueProcess.objects.get(pk=form.cleaned_data['process_id'])
			path = UPLOAD_PATH + issueProcess.file
			entities = []
			rows = parse(path)		
			for row in rows:
				issueInput = models.IssueInput()
				issueInput.ref = row.id
				issueInput.project = row.project
				issueInput.informer = row.informer
				issueInput.assignee = row.assignee
				issueInput.priority = row.priority
				issueInput.severity = row.severity
				issueInput.reproducibility = row.repro
				issueInput.product = row.version
				issueInput.category = row.category
				issueInput.delivery_date = row.creation
				issueInput.updated_date = row.modification
				issueInput.resume = row.resume
				issueInput.status = row.status
				issueInput.resolution = row.resolution
				issueInput.process = issueProcess
				entities.append(issueInput)
			models.IssueInput.objects.bulk_create(entities)
			issueProcess.imported = True
			issueProcess.count = len(entities)
			issueProcess.dateImported = datetime.now()
			issueProcess.save()
		return HttpResponseRedirect('step3')
	else:
		processes = models.IssueProcess.objects.filter(imported=False)
		context = {'processes':processes}
		return render(request, 'quality/step2.html', context)

@login_required
def process_csv(request):
	if request.method == 'POST':
		form = forms.ProcessCvsForm(request.POST)
		if form.is_valid():
			process_id = form.cleaned_data['process_id']
			total = models.IssueInput.objects.filter(process=process_id).count()
			thread = Thread(target=call_process_issues, args=(process_id,))
			thread.start()
		return render(request, 'quality/step3_1.html', {'process_id':process_id, 'total': total})
	else:
		processes = models.IssueProcess.objects.filter(imported=True, processed=False)
		context = {'processes':processes}
		return render(request, 'quality/step3.html', context)

@login_required
def count_processed(request, process_id):
	processed = models.IssueInput.objects.filter(process=process_id, result__gt=0).count()
	return JsonResponse({'processed':processed})

@login_required
def results_csv(request):
	context = {}
	if request.method == 'POST':
		form = forms.ProcessCvsForm(request.POST)
		if form.is_valid():
			process_id = form.cleaned_data['process_id']
			process = models.IssueProcess.objects.get(pk=process_id)
			process.inserted_count = models.IssueInput.objects.filter(process=process_id, result=4).count()
			process.updated_count = models.IssueInput.objects.filter(process=process_id, result=6).count()
			process.save()
			context['process'] = process
			context['projects_not_found'] =  models.IssueInput.objects.filter(process=process_id, result=1).values('project').annotate(count=Count('project'))
			context['inputs_with_error'] = models.IssueInput.objects.filter(process=process_id, result__in=[2,3,5])
	return render(request, 'quality/step4.html', context)

@login_required
def finish_csv(request):
	context = {}
	if request.method == 'POST':
		form = forms.ProcessCvsForm(request.POST)
		if form.is_valid():
			process_id = form.cleaned_data['process_id']
			models.IssueInput.objects.filter(process=process_id).delete()
	return render(request, 'quality/step5.html', context)


