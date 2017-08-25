from django.shortcuts import render
from django.db.models import Max, Sum, Count
from django.http import HttpResponseRedirect

from . import models
from . import forms

METRICS = 6

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


def capture(request):
	projects = models.Project.objects.all().order_by('-priority')
	if request.method == 'POST':
		form = forms.MetricsForm(request.POST)
		print 'is valid %s' % form.is_valid() 
		for field in form:
			print ('%s %s') % (field, field.errors)
		if form.is_valid():
			print 'Llego aqui'
			return HttpResponseRedirect('/viewer')
	else:
		form = forms.MetricsForm()

	return render(request, 'viewer/form.html', {'form': form, 'projects': projects})
