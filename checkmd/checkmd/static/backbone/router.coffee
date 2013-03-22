define [
  'jquery'
  'underscore'
  'backbone'
  'views/index'
], ($, _, Backbone, IndexView) ->
  AppRouter = Backbone.Router.extend
    routes:
      '': 'index'

    start: ->
      Backbone.history.start
        pushState: true
        root: '/v1/'
        silent: false

    index: ->
      indexView = new IndexView()
      indexView.render()

  initialize = (opts) ->
    app_router = new AppRouter()
    app_router.start()

  {initialize: initialize}