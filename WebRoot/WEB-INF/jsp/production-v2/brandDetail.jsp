<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil,com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="common/common.jsp"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=LocalizationUtil.getClientString("SEO.Title", request)%></title>
<meta http-equiv="keywords"
	content="<%=LocalizationUtil.getClientString("SEO.Keywords", request)%>" />
<meta http-equiv="description"
	content="<%=LocalizationUtil.getClientString("SEO.Description", request)%>" />

<link type="text/css" rel="stylesheet" charset="utf-8"
	href="<%=CSS_PATH%>layout.css?version=<%=version%>" />
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="<%=CSS_PATH%>zzsc.css?version=<%=version%>" />
<link type="text/css" rel="stylesheet" charset="utf-8"
	href="<%=CSS_PATH%>flexslider.min.css?version=<%=version%>" />

<script type="text/javascript" src="<%=JS_PATH%>jquery.min.js"></script>
<script type="text/javascript"
	src="<%=JS_PATH%>jquery.flexslider.min.js"></script>


<script type="text/javascript">
	$(window).load(function() {
		$('.flexslider').flexslider();
	});

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
</script>
<script>
	$(function() {
		$(".moduletable-banner-product").mouseenter(function() {
			$(".ad-text").fadeIn(500);

		}).mouseleave(function() {
			$(".ad-text").fadeOut(500);

		});

		$('.rollBox .Cont .pic img').mousemove(function() {

			$(this).css("opacity", 1);
		}).mouseout(function() {
			$(this).css("opacity", 0.7);

		});

	})
</script>



</head>

<body class="bg_img">
	<%@ include file="common/head.jsp"%>

	<div class="row2-product">

		<div class="moduletable-banner-product">
			<div class="ad-text"
				style="height:374px; overflow:hidden; display:none;">
				<%
					if(LocalizationUtil.getLocale(request).equals(Locale.CHINA)){
				%>
				${productDTO.infoPrd}
				<%
					} else {
				%>
				${productDTO.infoEnPrd}
				<%
					}
				%>
			</div>
			<div class="flexslider">
				<ul class="slides">
					<c:forEach items="${productPicDTOList}" var="productPicDTO">
						<li><a href="#"> <img src="${productPicDTO.picPathPrdp}"
								alt="${productPicDTO.picNamePrdp}"
								onload="imagezoom.call(this, 872, 424);" /></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!--row3-->
	<div class="row3">

		<div class="rollBox">

			<div class="Cont" id="ISL_Cont">
				<div class="ScrCont">
					<div id="List1">
						<!-- 图片列表 begin -->
						<c:forEach items="${productDTOList}" var="productDTO">
							<c:choose>
								<c:when test="${productDTO.idPrd==pId}">
									<div class="pic">
										<a
											href="brand.do?action=detail&id=${brandDTO.idBrd}&pId=${productDTO.idPrd}"><img
											src="${productDTO.logoPathPrd}"
											alt="${productDTO.logoNamePrd}"
											onload="imagezoom.call(this, 175, 85);"  style="opacity:1;"/></a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="pic">
										<a
											href="brand.do?action=detail&id=${brandDTO.idBrd}&pId=${productDTO.idPrd}"><img
											src="${productDTO.logoPathPrd}"
											alt="${productDTO.logoNamePrd}"
											onload="imagezoom.call(this, 175, 85);" /></a>
									</div>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<!-- 图片列表 end -->
					</div>
					<div id="List2">
						<!-- 图片列表 begin -->
						<!-- 图片列表 end -->
					</div>
				</div>
			</div>

		</div>
		<img onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()"
			onmouseout="ISL_StopUp()" class="img2"
			src="<%=IMAGE_PATH%>ad_scroll_back.png" /> <img
			onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()"
			onmouseout="ISL_StopDown()" class="img1"
			src="<%=IMAGE_PATH%>ad_scroll_forward.png" />
	</div>
	<!--row3-->



	<script>
		$(function() {
			$('.img2,.img1').hide();
			$(".row3").mouseenter(function() {
				$('.img2,.img1').show();

			}).mouseleave(function() {

				$('.img2,.img1').hide();
			});

		});
	</script>
	<script language="javascript" type="text/javascript">
	<!--//--><![CDATA[//><!--
		//图片滚动列表 mengjia 070816
		var Speed = 10; //速度(毫秒)
		var Space = 10; //每次移动(px)
		var PageWidth = 176; //翻页宽度
		var fill = 0; //整体移位
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
		AutoPlay();
		function GetObj(objName) {
			if (document.getElementById) {
				return eval('document.getElementById("' + objName + '")');
			} else {
				return eval

				('document.all.' + objName);
			}
		}
		function AutoPlay() { //自动滚动
			clearInterval(AutoPlayObj);
			AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();', 5000); //间隔时间
		}
		function ISL_GoUp() { //上翻开始
			if (MoveLock)
				return;
			clearInterval(AutoPlayObj);
			MoveLock = true;
			MoveTimeObj = setInterval('ISL_ScrUp();', Speed);
		}
		function ISL_StopUp() { //上翻停止
			clearInterval(MoveTimeObj);
			if (GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0) {
				Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
				CompScr();
			} else {
				MoveLock = false;
			}
			AutoPlay();
		}
		function ISL_ScrUp() { //上翻动作
			if (GetObj('ISL_Cont').scrollLeft <= 0) {
				GetObj('ISL_Cont').scrollLeft = GetObj

				('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth;
			}
			GetObj('ISL_Cont').scrollLeft -= Space;
		}
		function ISL_GoDown() { //下翻
			clearInterval(MoveTimeObj);
			if (MoveLock)
				return;
			clearInterval(AutoPlayObj);
			MoveLock = true;
			ISL_ScrDown();
			MoveTimeObj = setInterval('ISL_ScrDown()', Speed);
		}
		function ISL_StopDown() { //下翻停止
			clearInterval(MoveTimeObj);
			if (GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0) {
				Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth
						+ fill;
				CompScr();
			} else {
				MoveLock = false;
			}
			AutoPlay();
		}
		function ISL_ScrDown() { //下翻动作
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
			if (Comp < 0) { //上翻
				if (Comp < -Space) {
					Comp += Space;
					num = Space;
				} else {
					num = -Comp;
					Comp = 0;
				}
				GetObj('ISL_Cont').scrollLeft -= num;
				setTimeout('CompScr()', Speed);
			} else { //下翻
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
		//--><!]]>
	</script>
</body>
</html>