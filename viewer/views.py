from django.shortcuts import render
from django.db.models import Max, Sum, Count
from django.http import HttpResponseRedirect
from datetime import datetime
from django.contrib.auth.decorators import login_required

from . import models
from . import forms

METRICS = 6

METRIC_SIZE = 'Size'
METRIC_BUGS = 'Bugs'
METRIC_VULNERABILITIES = 'Vulnerabilities'
METRIC_CODE_SMELLS = 'Code Smells'
METRIC_DUPLICATED = 'Duplicated Block'
METRIC_COMPLEXITY = 'Complexity'

class MetricInfo(object):

	def __init__(self, id, name, values):
		self.id = id
		self.name = name
		self.values = values

def index(request):

	entries = models.Entry.objects.all().values('project__name', 'project__priority').filter(metric=5).annotate(max_date=Max('date'), sum_value=Sum('value')).order_by('-project__priority')
	data = []
	updates = models.Entry.objects.values('project__name', 'project__priority').annotate(count=Count('id')).order_by('-project__priority')
	ocurrences = []
	for update in updates:
		ocurrences.append({'project':update['project__name'], 'value':update['count'] / METRICS})
	for entry in entries:
		data.append({'project':entry['project__name'], 'value':entry['sum_value']})
	context = {
		'data' : data,
		'ocurrences' : ocurrences
#		'data' : models.Entry.objects.all()
	}
	return render(request, 'viewer/index.html', context)

def detail(request, project):
	projectObj = models.Project.objects.get(name=project)
	metrics = models.Metric.objects.all()
	projects = models.Project.objects.all().order_by('-priority')
	info = []
	cur_date = models.Entry.objects.filter(project_id=projectObj.id).latest('date').date
	entries = models.Entry.objects.filter(project_id=projectObj.id, date=cur_date)
	for m in metrics:
		data = models.Entry.objects.filter(project_id=projectObj.id, metric_id=m.id)
		metric = MetricInfo(m.id, m.description, data)
		info.append(metric)

	context = {
		'project' : project,
		'info' : info,
		'projects': projects,
		'entries' : entries
	}
	return render(request, 'viewer/detail.html', context)

@login_required
def capture(request):
	projects = models.Project.objects.all().order_by('-priority')
	if request.method == 'POST':
		form = forms.MetricsForm(request.POST)		
		if form.is_valid():
			
			project = models.Project.objects.get(pk=form.cleaned_data['project_id'])
			str_date_time = '%s %s' % (form.cleaned_data['date'], form.cleaned_data['time'][0:5])			
			date_time = datetime.strptime(str_date_time, '%d/%m/%Y %H:%M')
			# Metric Size
			metric = models.Metric.objects.get(description = METRIC_SIZE)
			entry = models.Entry()
			entry.project = project
			entry.metric = metric
			entry.date = date_time
			entry.value = int(form.cleaned_data['size'])
			entry.save()
			# Metric Bugs
			metric = models.Metric.objects.get(description = METRIC_BUGS)
			entry = models.Entry()
			entry.project = project
			entry.metric = metric
			entry.date = date_time
			entry.value = int(form.cleaned_data['bugs'])
			entry.save()
			# Metric Vulnerabilities
			metric = models.Metric.objects.get(description = METRIC_VULNERABILITIES)
			entry = models.Entry()
			entry.project = project
			entry.metric = metric
			entry.date = date_time
			entry.value = int(form.cleaned_data['vulnerabilities'])			
			entry.save()
			# Metric Code Smells
			metric = models.Metric.objects.get(description = METRIC_CODE_SMELLS)
			entry = models.Entry()
			entry.project = project
			entry.metric = metric
			entry.date = date_time
			entry.value = int(form.cleaned_data['smells'])			
			entry.save()
			# Metric Duplicated Block
			metric = models.Metric.objects.get(description = METRIC_DUPLICATED)
			entry = models.Entry()
			entry.project = project
			entry.metric = metric
			entry.date = date_time
			entry.value = int(form.cleaned_data['dup_blocks'])			
			entry.save()
			# Metric Complexity
			metric = models.Metric.objects.get(description = METRIC_COMPLEXITY)
			entry = models.Entry()
			entry.project = project
			entry.metric = metric
			entry.date = date_time
			entry.value = int(form.cleaned_data['complexity'])			
			entry.save()			

			#return HttpResponseRedirect('/viewer')
	else:
		form = forms.MetricsForm()

	return render(request, 'viewer/form.html', {'form': form, 'projects': projects})
