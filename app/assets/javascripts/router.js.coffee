# For more information see: http://emberjs.com/guides/routing/

EmberExample.Router.map ()->
  @resource('todos', { path: '/' }, ->
    @route('active')
    @route('completed')
  )

EmberExample.TodosRoute = Ember.Route.extend
  model: ->
    @store.find('todo')

EmberExample.TodosIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('todos')

EmberExample.TodosActiveRoute = Ember.Route.extend
  model: ->
    @store.filter('todo', (todo) ->
      !todo.get('isCompleted')
    )
  renderTemplate: (controller) ->
    @render('todos/index', { controller: controller })

EmberExample.TodosCompletedRoute = Ember.Route.extend
  model: ->
    @store.filter('todo', (todo) ->
      todo.get('isCompleted')
    )
  renderTemplate: (controller) ->
    @render('todos/index', { controller: controller })
