from django.conf.urls import url
from . import views
urlpatterns = [
	url(r'^$', views.index, name="index"),
	url(r'^(?P<customer_id>\d+)/projects$', views.projects, name="projects"),
	url(r'^(?P<customer_id>\d+)/projects/(?P<project_id>\d+)/detail$', views.detail, name="detail"),
    url(r'^upload/step1', views.import_csv, name="import_csv"),
]