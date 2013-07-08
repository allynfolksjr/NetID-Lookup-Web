# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  dia_info = $('#diagnostics')
  $('#dia-toggle').click ->
    dia_info.fadeToggle()
    $('#dia-toggle > i.default-on').toggle()
    $('#dia-toggle > i.default-off').toggle()
