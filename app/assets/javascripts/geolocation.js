$(document).on('turbolinks:load', function() {

	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition);
	    }
	}
	function showPosition(position) {
	    $('#latitude').val(position.coords.latitude);
	    $('#longitude').val(position.coords.longitude);
	}

	var obtener = getLocation();

});