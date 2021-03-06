//初始化
$(window).load(function() {
	$('.flexslider').flexslider();
});

//鼠标经过效果
$(document).ready(function() {
	$('.flex-direction-nav li a').mousemove(function() {
		$(this).css("opacity", 1);

	}).mouseout(function() {
		$(this).css("opacity", 0);

	});

	$('.row2-product').hover(function() {
		$('.flex-direction-nav li a.prev').css('height', '424');
		$('.flex-direction-nav li a.next').css('height', '424');
		$('.flex-direction-nav li a.prev').css('width', '56');
		$('.flex-direction-nav li a.next').css('width', '56');

		$('.flex-direction-nav li a.prev').css('display', 'block');
		$('.flex-direction-nav li a.next').css('display', 'block');
	}, function() {
		$('.flex-direction-nav li a.prev').css('display', 'none');
		$('.flex-direction-nav li a.next').css('display', 'none');
	});

});

//图片描述处理
$(function() {
	var show=0;
	$(".moduletable-banner-product").mouseenter(function() {
		$(".ad-text").fadeIn(500);
		show=1;
	}).mouseleave(function() {
		$(".ad-text").fadeOut(500);
		show=0;
	});
	
	
	$(".moduletable-banner-product").click(function() {
		if(show==0){
			$(".ad-text").fadeIn(500);
			show=1;
		}else{
			$(".ad-text").fadeOut(500);
			show=0;
		}
	});
	
	

	$('.rollBox .Cont .pic img').mousemove(function() {
		$(this).css("opacity", 1);
	}).mouseout(function() {
		$(this).css("opacity", 0.7);
	});
});

//箭头效果
$(function() {
	$('.img2,.img1').hide();
	if(productNum>5){
		$(".row3").mouseenter(function() {
			$('.img2,.img1').show();
		}).mouseleave(function() {
			$('.img2,.img1').hide();
		});
	}

});


var productNum = val = $("#productNum")[0].value;
// 图片滚动列表
var Speed = 10; // 速度(毫秒)
var Space = 10; // 每次移动(px)
var PageWidth = 176; // 翻页宽度
var fill = 0; // 整体移位
var MoveLock = false;
var MoveTimeObj;
var Comp = 0;
var AutoPlayObj = null;
GetObj("List2").innerHTML = GetObj("List1").innerHTML;
GetObj('ISL_Cont').scrollLeft = fill;
GetObj("ISL_Cont").onmouseover = function() {
	clearInterval(AutoPlayObj);
};
GetObj("ISL_Cont").onmouseout = function() {
	AutoPlay();
};

//只有大于5时才自动播放
if(productNum>5){
	AutoPlay();
}

function GetObj(objName) {
	if (document.getElementById) {
		return eval('document.getElementById("' + objName + '")');
	} else {
		return eval

		('document.all.' + objName);
	}
}
function AutoPlay() { // 自动滚动
	clearInterval(AutoPlayObj);
	AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();', 5000); // 间隔时间
}
function ISL_GoUp() { // 上翻开始
	if (MoveLock)
		return;
	clearInterval(AutoPlayObj);
	MoveLock = true;
	MoveTimeObj = setInterval('ISL_ScrUp();', Speed);
}
function ISL_StopUp() { // 上翻停止
	clearInterval(MoveTimeObj);
	if (GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0) {
		Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
		CompScr();
	} else {
		MoveLock = false;
	}
	AutoPlay();
}
function ISL_ScrUp() { // 上翻动作
	if (GetObj('ISL_Cont').scrollLeft <= 0) {
		GetObj('ISL_Cont').scrollLeft = GetObj

		('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth;
	}
	GetObj('ISL_Cont').scrollLeft -= Space;
}
function ISL_GoDown() { // 下翻
	clearInterval(MoveTimeObj);
	if (MoveLock)
		return;
	clearInterval(AutoPlayObj);
	MoveLock = true;
	ISL_ScrDown();
	MoveTimeObj = setInterval('ISL_ScrDown()', Speed);
}
function ISL_StopDown() { // 下翻停止
	clearInterval(MoveTimeObj);
	if (GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0) {
		Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
		CompScr();
	} else {
		MoveLock = false;
	}
	AutoPlay();
}
function ISL_ScrDown() { // 下翻动作
	if (GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth) {
		GetObj('ISL_Cont').scrollLeft =

		GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;
	}
	GetObj('ISL_Cont').scrollLeft += Space;
}
function CompScr() {
	var num;
	if (Comp == 0) {
		MoveLock = false;
		return;
	}
	if (Comp < 0) { // 上翻
		if (Comp < -Space) {
			Comp += Space;
			num = Space;
		} else {
			num = -Comp;
			Comp = 0;
		}
		GetObj('ISL_Cont').scrollLeft -= num;
		setTimeout('CompScr()', Speed);
	} else { // 下翻
		if (Comp > Space) {
			Comp -= Space;
			num = Space;
		} else {
			num = Comp;
			Comp = 0;
		}
		GetObj('ISL_Cont').scrollLeft += num;
		setTimeout('CompScr()', Speed);
	}
}
