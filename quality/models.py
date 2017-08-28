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
