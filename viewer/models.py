from django.db import models

class Project(models.Model):
	name = models.CharField(max_length=100, unique=True, blank=False)
	active = models.BooleanField(default=True)
	priority = models.IntegerField(default=0)

	def __str__(self):
		return self.name

class Metric(models.Model):
	description = models.CharField(max_length=100, unique=True, blank=False)

	def __str__(self):
		return self.description

class Entry(models.Model):
	project = models.ForeignKey(Project)
	metric = models.ForeignKey(Metric)
	date = models.DateTimeField()
	value = models.IntegerField(default=0)

	def __str__(self):
		return '%s / %s / %s / %s' % (self.project, self.metric, self.date, self.value)