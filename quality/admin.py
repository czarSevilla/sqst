from django.contrib import admin

from .models import Customer
from .models import ProjectStatus
from .models import Project
from .models import Member
from .models import IssueStatus
from .models import IssuePriority
from .models import IssueSeverity
from .models import IssueResolution
from .models import Issue

admin.site.register(Customer)
admin.site.register(ProjectStatus)

@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
	date_hierarchy = 'start'
	list_display = ('id', 'name', 'customer', 'start', 'end', 'status', 'logo',)
	list_filter = ('customer',)


admin.site.register(Member)
admin.site.register(IssueStatus)
admin.site.register(IssuePriority)
admin.site.register(IssueSeverity)
admin.site.register(IssueResolution)

@admin.register(Issue)
class IssueAdmin(admin.ModelAdmin):
	date_hierarchy = 'created'
	list_display = ('id', 'project', 'reporter', 'assignee', 'status', 'priority', 'severity','resolution', 'created', 'resolved', 'closed', 'description',)
	list_filter = ('project', 'reporter', 'assignee', 'status', 'priority', 'severity','resolution',)