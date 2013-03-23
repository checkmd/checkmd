define [
  'jquery'
  'handlebars'
  'backbone'
  'text!templates/index.html'
  'text!templates/checklist.html'
  'collections/checklists'
], ($, Handlebars, Backbone, indexTemplate, checklistTemplate, ChecklistCollection) ->
  IndexView = Backbone.View.extend
    el: $("#index-container")

    initialize: ->
      @template = Handlebars.compile indexTemplate
      @checklistTemplate = Handlebars.compile checklistTemplate
      @checklistCollection = new ChecklistCollection()
      @checklistCollection.fetch
        success: => @addChecklists()

    render: ->
      @$el.html @template

    addChecklists: ->
      @$('ul').append @checklistCollection.render()
