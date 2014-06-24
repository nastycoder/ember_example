EmberExample.TodoController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set('isEditing', true)

    removeTodo: ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()

    acceptChanges: ->
      @set('isEditing', false)

      if Ember.isEmpty(this.get('model.title'))
        @send('removeTodo')
      else
        @get('model').save()

  isEditing: false

  complete: ((key, value) ->
    model = @get('model')

    if value?
      model.set "complete", value
      model.save()
      value
    else
      model.get "complete"

  ).property('model.complete')
