define [
  'jquery'
  'underscore'
  'backbone_tastypie'
  'models/checklist'
], ($, _, Backbone, Checklist) ->
  ChecklistCollection = Backbone.Collection.extend
    model: Checklist
    url: "/api/v1/checklist"
