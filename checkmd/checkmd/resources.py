from tastypie.resources import ModelResource
from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.authentication import Authentication

from checkmd.checkmd.models import Checklist, Step

class StepResource(ModelResource):
    class Meta:
        queryset = Step.objects.all()
        resource_name = "step"        
        authorization = Authorization()
        authentication = Authentication()

class ChecklistResource(ModelResource):
    steps = fields.ToManyField(StepResource, 'steps', full=True)
    class Meta:
        queryset = Checklist.objects.all()
        allowed_methods = ['get']
        authorization = Authorization()
        authentication = Authentication()

        filtering = {
            "id": "exact",
        }



