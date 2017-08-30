from django.db import models

class Customer(models.Model):
	name = models.CharField(max_length=100, unique=True, blank=False)
	logo = models.CharField(max_length=100, blank=False)

	def __str__(self):
		return self.name

class ProjectStatus(models.Model):
	description = models.CharField(max_length=100, unique=True, blank=False)

	def __str__(self):
		return self.description

class Project(models.Model):
	name = models.CharField(max_length=100, blank=False)
	customer = models.ForeignKey(Customer)
	start = models.DateField(null=True, blank=True)
	end = models.DateField(null=True, blank=True)
	status = models.ForeignKey(ProjectStatus)
	logo = models.CharField(max_length=100)

	def __str__(self):
		return self.name

class Member(models.Model):
	name = models.CharField(max_length=100, blank=False)

	def __str__(self):
		return self.name

class IssueStatus(models.Model):
	description = models.CharField(max_length=100, unique=True, blank=False)

	def __str__(self):
		return self.description	

class IssuePriority(models.Model):
	description = models.CharField(max_length=100, unique=True, blank=False)

	def __str__(self):
		return self.description	

class IssueSeverity(models.Model):
	description = models.CharField(max_length=100, unique=True, blank=False)

	def __str__(self):
		return self.description

class IssueResolution(models.Model):
	description = models.CharField(max_length=100, unique=True, blank=False)

	def __str__(self):
		return self.description

class Issue(models.Model):
	project = models.ForeignKey(Project)
	reporter = models.ForeignKey(Member, related_name = 'reporter')
	assignee = models.ForeignKey(Member, related_name = 'assignee') 
	status = models.ForeignKey(IssueStatus)
	priority = models.ForeignKey(IssuePriority)
	severity = models.ForeignKey(IssueSeverity)
	resolution = models.ForeignKey(IssueResolution, null=True)
	description = models.CharField(max_length=500, blank=False)
	created = models.DateField()
	resolved = models.DateField(null=True)
	closed = models.DateField(null=True)

	def __str__(self):
		return self.description

class IssueProcess(models.Model):
	file = models.CharField(max_length=100)
	source = models.CharField(max_length=100)
	dateLoaded = models.DateTimeField()
	imported = models.BooleanField(default=False)
	count = models.IntegerField(default=0)
	dateImported = models.DateTimeField(null=True, blank=True)
	processed = models.BooleanField(default=False)
	dateProcessed = models.DateTimeField(null=True, blank=True)


class IssueInput(models.Model):
	ref = models.CharField(max_length=20)
	project = models.CharField(max_length=100)
	informer = models.CharField(max_length=100)
	assignee = models.CharField(max_length=100)
	priority = models.CharField(max_length=50)
	severity = models.CharField(max_length=50)
	reproducibility = models.CharField(max_length=50, null=True, blank=True)
	product = models.CharField(max_length=50, null=True, blank=True)
	category = models.CharField(max_length=50, null=True, blank=True);
	delivery_date = models.DateField(null=True, blank=True)
	updated_date = models.DateField(null=True, blank=True)
	resume = models.CharField(max_length=200, null=True, blank=True)
	status = models.CharField(max_length=50, null=True, blank=True)
	resolution = models.CharField(max_length=50, null=True, blank=True)
	process = models.ForeignKey(IssueProcess)

	def __str__(self):
		return '''[ref=%s, project=%s informer=%s
assignee=%s
priority=%s
severity=%s
reproducibility=%s
product=%s
category=%s
delivery_date=%s
updated_date=%s
resume=%s
status=%s
resolution=%s
process=%s]''' % (self.ref, self.project, self. informer, self.assignee, self.priority, self.severity, self.reproducibility, self.product, self.category, self.delivery_date, self.updated_date, self.resume, self.status, self.resolution, self.process)
	