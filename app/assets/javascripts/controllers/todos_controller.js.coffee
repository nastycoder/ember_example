EmberExample.TodosController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      title = @get('newTitle')
      unless title.trim() then return

      todo = @store.createRecord('todo', {
        title: title
        complete: false
      })

      @set('newTitle', '')
      todo.save()

    clearCompleted: ->
      completed = @filterBy('complete', true)
      completed.invoke('deleteRecord')
      completed.invoke('save')

  allAreDone: ((key, value) ->
    if value?
      @setEach('complete', value)
      @invoke('save')
      value
    else
      @get('length') && @everyProperty('complete', true)
  ).property('@each.complete')

  hasCompleted: (->
    @get('completed') > 0
  ).property('completed')

  completed: (->
    @filterBy('complete', true).get('length')
  ).property('@each.complete')

  remaining: (->
    @filterBy('complete', false).get('length')
  ).property('@each.complete')

  inflection: (->
    remaining = @get('remaining')
    if remaining is 1 then 'todo' else 'todos'
  ).property('remaining')
