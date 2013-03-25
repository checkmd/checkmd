# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Step.description'
        db.add_column(u'checkmd_step', 'description',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=255),
                      keep_default=False)

        # Adding field 'Step.completed'
        db.add_column(u'checkmd_step', 'completed',
                      self.gf('django.db.models.fields.BooleanField')(default=False),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Step.description'
        db.delete_column(u'checkmd_step', 'description')

        # Deleting field 'Step.completed'
        db.delete_column(u'checkmd_step', 'completed')


    models = {
        u'checkmd.checklist': {
            'Meta': {'object_name': 'Checklist'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        u'checkmd.step': {
            'Meta': {'object_name': 'Step'},
            'checklist': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['checkmd.Checklist']"}),
            'completed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'description': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '255'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['checkmd']