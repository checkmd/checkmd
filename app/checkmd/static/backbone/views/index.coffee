define [
  'jquery'
  'handlebars'
  'backbone'
  'backbone-forms'
  'bb_forms_list'
  'bb_forms_inline'
  'text!templates/index.html'
  'text!templates/checklist.html'
  'collections/checklists'
  'models/checklist'
], ($, Handlebars, Backbone, Form, FormList, FormInlineNestedModel,
    indexTemplate, checklistTemplate, 
    ChecklistCollection, Checklist) ->
  IndexView = Backbone.View.extend
    el: $("#index-container")

    events:
      "click input#add-checklist": "addStep"

    initialize: ->
      @template = Handlebars.compile indexTemplate
      @checklistTemplate = Handlebars.compile checklistTemplate
      @checklistCollection = new ChecklistCollection()
      @checklistCollection.fetch
        success: => @addChecklists()

      @newChecklistForm = new Backbone.Form {model: new Checklist()}
      @newChecklistForm.render()

    render: ->
      @$el.append @newChecklistForm.el
      @$el.append $("<input type='button' value='click me' id='add-checklist'></input>")
      @$el.append @template

    addChecklists: ->
      checklists = []
      @checklistCollection.forEach (checklist) =>
        el = $('<li></li>').append @checklistTemplate checklist.toJSON()
        checklists.push el
      @$('ul#checklists').append checklists

    addStep: ->
      errors = @newChecklistForm.commit {validate: true}
      unless errors
        @newChecklistForm.model.save()
