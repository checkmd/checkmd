from tastypie.resources import ModelResource
from tastypie import fields
from tastypie.authorization import Authorization
from tastypie.authentication import Authentication

from checkmd.models import Checklist, Step

class StepResource(ModelResource):
    checklist = fields.ToOneField('checkmd.resources.ChecklistResource', 
                                  'checklist')

    class Meta:
        queryset = Step.objects.all()
        resource_name = "step"        
        authorization = Authorization()
        authentication = Authentication()


class ChecklistResource(ModelResource):
    steps = fields.ToManyField(StepResource, 'steps', full=True)
    class Meta:
        queryset = Checklist.objects.all()
        resource_name = 'checklist'
        allowed_methods = ['get', 'post']
        authorization = Authorization()
        authentication = Authentication()

        filtering = {
            "id": "exact",
        }

    def hydrate(self, bundle):
        [step.update({"checklist": bundle.obj}) for step in bundle.data['steps']]
        return bundle
