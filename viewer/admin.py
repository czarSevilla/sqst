from django.contrib import admin

from .models import Project
from .models import Metric
from .models import Entry


admin.site.register(Metric)

@admin.register(Entry)
class EntryAdmin(admin.ModelAdmin):
	date_hierarchy = 'date'
	list_display = ('id', 'project', 'metric', 'date', 'value',)
	list_filter = ('project', 'metric',)

@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
	list_display = ('id', 'name', 'active', 'priority',)
	list_filter = ('active', 'priority',)