$(function() {
	function init() {
		$("#image1").fadeIn(5000);
		setTimeout(function() {
			$("#image2").fadeIn(6000);
		}, 1000);
		setTimeout(function() {
			$("#image3").fadeIn(6000);
		}, 1000);
	}

	init();
});