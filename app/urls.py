from django.conf.urls import patterns, include, url

from tastypie.api import Api

from checkmd.views import IndexView
from checkmd.resources import ChecklistResource, StepResource

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

v1_api = Api(api_name='v1')
v1_api.register(ChecklistResource())
v1_api.register(StepResource())

urlpatterns = patterns('',
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^api/', include(v1_api.urls)),
)
