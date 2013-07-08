# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.hidden-content-toggle').click ->
    element = $(this).closest('.hidden-things').find('.hidden-content')
    element.fadeToggle(150)
    $(this).find('i.default-on').toggle()
    $(this).find('i.default-off').toggle()
  $('.expand-all').click ->
    $(this).closest('.clustered-content').find('.hidden-content').fadeIn()
    iconOn($(this).closest('.clustered-content'))
  $('.collapse-all').click ->
    $(this).closest('.clustered-content').find('.hidden-content').fadeOut()
    iconOff($(this).closest('.clustered-content'))

  iconOff = (scope) ->
    scope.find('i.default-on').show()
    scope.find('i.default-off').hide()


  iconOn = (scope) ->
    scope.find('i.default-on').hide()
    scope.find('i.default-off').show()

