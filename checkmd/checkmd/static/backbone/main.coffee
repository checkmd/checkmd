require.config
  baseUrl: "static/backbone"
  paths:
    underscore: 'components/lodash/lodash'
    jquery: 'components/jquery/jquery'
    backbone: 'components/backbone/backbone'
    backbone_tastypie: 'components/backbone-tastypie/backbone-tastypie'
    backfire: 'components/backfire/backbone-firebase'
    text: 'components/text/text'
    handlebars: 'components/handlebars/handlebars'

  shim:
    backfire:
      deps: ['backbone']
      exports: 'Backbone'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    backbone_tastypie:
      deps: ['backbone']
      exports: 'Backbone'
    underscore:
      exports: '_'
    handlebars:
      exports: "Handlebars"

require ['app', 'backbone_tastypie'], (App, Backbone) ->
  App.initialize()

  # Backbone.emulateHTTP = true
  # Backbone.Tastypie.doGetOnEmptyPutResponse = true

  $(document).on "click", "a:not([data-bypass])", (e) ->
    href =
      prop: $(@).prop "href"
      attr: $(@).attr "href"

    root = "#{location.protocol}//#{location.host}#{App.root}"

    if href.prop and href.prop[0...root.length] is root
      e.preventDefault()
      Backbone.history.navigate href.attr, true
