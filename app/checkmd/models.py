from django.db import models

# Create your models here.

class Checklist(models.Model):
    name = models.CharField(max_length=255, null=False)
    # author = models.ForeignKey(User)

class Step(models.Model):
    checklist = models.ForeignKey(Checklist, related_name='steps')
    description = models.CharField(max_length=255, default="")
    completed = models.BooleanField(default=False)

