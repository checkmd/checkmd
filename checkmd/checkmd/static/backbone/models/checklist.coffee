define [
  'jquery'
  'backbone_tastypie'
  'collections/steps'
], ($, Backbone, StepCollection) ->
  ChecklistModel = Backbone.Model.extend
    url: -> 
      url = "/api/v1/checklist/"
      if @get '_id'
         url += "#{@get('_id')}/"
      url

    parse: (response) ->
      steps = new StepCollection()
      steps.add(response.steps)
      @set "steps", steps

    forTemplate: () ->
      json = @toJSON()
      json.steps = @get('steps').toJSON()
      json
