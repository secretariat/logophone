# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# jQuery ->
# 	$('#testo').delay(gon.time).fadeOut('slow');
jQuery ->
	$(':input:enabled:visible:first').focus();
	# $("form:first *:input[type!=hidden]:first").focus()