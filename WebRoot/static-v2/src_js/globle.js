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
	}else if(objTop>0){
		obj.css({'margin-left': 0 + 'px', 'margin-top': objTop + 'px'});
	}else if(objLeft>0){
		obj.css({'margin-left': objLeft + 'px', 'margin-top': 0 + 'px'});
	}else{
		obj.css({'margin-left': 0 + 'px', 'margin-top': 0 + 'px'});
	}
	obj.show();
}

/*
 * 通过样式控制 margin:auto;
 * .header{ height:102px;margin:14.5 auto 0 auto; overflow:hidden;}
 * .include-center{
	width:872px;
	height:612px;
	margin:auto;
}
.include-center-load{
	width:350px;
	height:60px;
	font-size:50px;
	color:#f1f2f2;
	margin:auto;	
}
*/
center($('.include-center'));
center($('.include-center-load'));
window.onresize = function(){  
	center($('.include-center'));
};
