define [
  'jquery'
  'backbone_tastypie'
], ($, Backbone) ->
  StepModel = Backbone.Model.extend
    url: -> 
      url = "/api/v1/step/"
      if @get '_id'
         url += "#{@get('_id')}/"
      url

