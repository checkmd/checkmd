# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Checklist'
        db.create_table(u'checkmd_checklist', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
        ))
        db.send_create_signal(u'checkmd', ['Checklist'])

        # Adding model 'Step'
        db.create_table(u'checkmd_step', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('checklist', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['checkmd.Checklist'])),
        ))
        db.send_create_signal(u'checkmd', ['Step'])


    def backwards(self, orm):
        # Deleting model 'Checklist'
        db.delete_table(u'checkmd_checklist')

        # Deleting model 'Step'
        db.delete_table(u'checkmd_step')


    models = {
        u'checkmd.checklist': {
            'Meta': {'object_name': 'Checklist'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        u'checkmd.step': {
            'Meta': {'object_name': 'Step'},
            'checklist': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['checkmd.Checklist']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['checkmd']