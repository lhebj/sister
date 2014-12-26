$(window).load(function() {
	$('.flexslider').flexslider();
});

$(document).ready(function() {
	$('.flexslider').hover(function() {
		$('.flex-direction-nav li a.prev').css('width', '56');
		$('.flex-direction-nav li a.next').css('width', '56');

		$('.flex-direction-nav li a.prev').css('display', 'block');
		$('.flex-direction-nav li a.next').css('display', 'block');
	}, function() {
		$('.flex-direction-nav li a.prev').css('display', 'none');
		$('.flex-direction-nav li a.next').css('display', 'none');
	});

	$('.flex-direction-nav li a.prev').hover(function() {
		$('.flex-direction-nav li a.prev').css('display', 'block');
	}, function() {
		// $('.flex-direction-nav li a.prev').css('display', 'none');
	});

	$('.flex-direction-nav li a.next').hover(function() {
		$('.flex-direction-nav li a.next').css('display', 'block');
	}, function() {
		// $('.flex-direction-nav li a.next').css('display', 'none');
	});

	$('.left-slides').hover(function() {
		$('.flex-direction-nav li a.prev').css('width', '56');
		$('.flex-direction-nav li a.next').css('width', '56');

		$('.flex-direction-nav li a.prev').css('display', 'block');
		$('.flex-direction-nav li a.next').css('display', 'block');
	}, function() {
		$('.flex-direction-nav li a.prev').css('display', 'none');
		$('.flex-direction-nav li a.next').css('display', 'none');
	});

	$('.right-slides').hover(function() {
		$('.flex-direction-nav li a.prev').css('width', '56');
		$('.flex-direction-nav li a.next').css('width', '56');

		$('.flex-direction-nav li a.prev').css('display', 'block');
		$('.flex-direction-nav li a.next').css('display', 'block');
	}, function() {
		$('.flex-direction-nav li a.prev').css('display', 'none');
		$('.flex-direction-nav li a.next').css('display', 'none');
	});
});