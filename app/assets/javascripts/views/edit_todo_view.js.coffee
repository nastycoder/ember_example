EmberExample.EditTodoView = Ember.TextField.extend({
  didInsertElement: ->
    this.$().focus()
})

Ember.Handlebars.helper('edit-todo', EmberExample.EditTodoView)
