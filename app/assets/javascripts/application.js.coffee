#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ember_example

# for more details see: http://emberjs.com/guides/application/
window.EmberExample = Ember.Application.create()

# Use the CSRF token in all requests beck to the server
$ ->
  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter (options, originalOptions, xhr) ->
    xhr.setRequestHeader('X-CSRF-Token', token)
