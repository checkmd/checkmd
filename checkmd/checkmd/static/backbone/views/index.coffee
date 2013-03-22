define [
  'jquery'
  'handlebars'
  'backbone'
  'text!templates/index.html'
], ($, Handlebars, Backbone, indexTemplate) ->
  IndexView = Backbone.View.extend
    el: $("#index-container")
    initialize: ->
      @template = Handlebars.compile indexTemplate

    render: ->
      @$el.html @template
