define [
  'jquery'
  'underscore'
  'backbone_tastypie'
  'models/step'
], ($, _, Backbone, Step) ->
  StepCollection = Backbone.Collection.extend
    model: Step
    url: "/api/v1/step"