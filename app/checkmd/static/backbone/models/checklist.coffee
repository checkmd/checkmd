define [
  'jquery'
  'backbone_tastypie'
  'collections/steps'
  'models/step'
], ($, Backbone, StepCollection, Step) ->
  ChecklistModel = Backbone.Model.extend

    schema:
      name: 'Text',
      steps:
        type: 'List'
        itemType: 'InlineNestedModel'
        model: Step

    url: -> 
      url = "/api/v1/checklist/"
      if @get '_id'
         url += "#{@get('_id')}/"
      url

    parse: (response) ->
      steps = new StepCollection()
      steps.add(response.steps)
      @set "steps", steps
      response
