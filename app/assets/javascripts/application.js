// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap-tagsinput
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
	
$(document).on('turbolinks:load', function() {

	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition);
	    }
	}
	function showPosition(position) {

	    $('#latitude').val(position.coords.latitude);
	    $('#longitude').val(position.coords.longitude);

	    $.ajax({
		  url: "/set_location?latitude="+position.coords.latitude+"&longitude="+position.coords.longitude
		}).done(function() {
			console.log("Session saved Lat: "+position.coords.latitude+", Lng: "+position.coords.longitude);
		});
	}

	var obtener = getLocation();

	//Set options in field
	$(".tr_options").click( function() {
		var option = $(this).data('option');
		alert("hola mundo " + option);
	});

});