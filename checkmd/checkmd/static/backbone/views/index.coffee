define [
  'jquery'
  'handlebars'
  'backbone'
  'text!templates/index.html'
  'text!templates/checklist.html'
  'models/checklist'
], ($, Handlebars, Backbone, indexTemplate, checklistTemplate, Checklist) ->
  IndexView = Backbone.View.extend
    el: $("#index-container")

    initialize: ->
      @template = Handlebars.compile indexTemplate
      @checklistTemplate = Handlebars.compile checklistTemplate
      @checklist = new Checklist({_id: 4})
      @checklist.fetch
        success: => @addChecklist()

    render: ->
      @$el.html @template

    addChecklist: ->

      @$('nav').append @checklistTemplate @checklist.forTemplate()
