// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
// 

$(function() {
	$('.tran-desc').popover({placement: "bottom", title: "Description"});
});

window.onload = function(){
  var text_input = document.getElementById ('value-field');
  text_input.focus ();
  text_input.select ();
}
