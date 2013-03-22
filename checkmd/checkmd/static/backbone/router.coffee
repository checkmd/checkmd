define [
  'jquery',
  'underscore',
  'backbone',
], ($, _, Backbone) ->
  AppRouter = Backbone.Router.extend
    routes:
      '': 'index'

    start: ->
      Backbone.history.start
        pushState: true
        root: '/v1/'
        silent: false

  initialize = (opts) ->
    app_router = new AppRouter()
    app_router.start()

  {initialize: initialize}