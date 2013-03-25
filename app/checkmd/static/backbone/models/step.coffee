define [
  'jquery'
  'backbone_tastypie'
], ($, Backbone) ->
  StepModel = Backbone.Model.extend
  
    schema: 
      description: 'Text'

    url: -> 
      url = "/api/v1/step/"
      if @get '_id'
         url += "#{@get('_id')}/"
      url

