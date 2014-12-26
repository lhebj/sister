function navShareClick() {
	var $shareIcon = $('#shareIcon');
	$shareIcon.show();
}

function center(obj) {
	var screenWidth = $(window).width(), screenHeight = $(window).height();  //当前浏览器窗口的 宽高
	var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度
	    
	var objLeft = (screenWidth - obj.width())/2 ;
	var objTop = (screenHeight - obj.height())/2 + scrolltop;
	if(objTop>0 && objLeft>0){
		obj.css({'margin-left': objLeft + 'px', 'margin-top': objTop + 'px'});
	}
}

center($('.include-center'));
center($('.include-center-load'));
