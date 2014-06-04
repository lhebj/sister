<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil"%>
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
<title>jquery tool</title>
<style type="text/css">
/**/
.roll{
width:1030px;//图片宽
height:418px;//图片高
overflow:hidden;
position:relative;
}
.roll ul {
position:absolute;
list-style-type:none;
filter: Alpha(Opacity=80);
opacity:0.8;
border:none 0px;
z-index:10;
padding:0;
top: 380px;//
right: 0px;//点的位置
}
.roll ul li {
padding:0px 2px;
float:left;
display:block;
color:#FFF;
text-indent:2000px;
overflow:hidden;
border:none 0px;
width:12px;
height:12px;
background:url(images/blue.png) no-repeat center center;
cursor:pointer
}
.roll ul li.on {
background:url(images/white.png) no-repeat center center;
}
.roll .show_list .box {
position:absolute;
}
/**/
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
var t = n = 0, count;
$(document).ready(function(){
count=$(".show_list .box").length;
$(".show_list .box:not(:first-child)").hide();
$(".roll li").click(function() {
var i = $(this).text() - 1;//获取Li元素内的值，即1，2
n = i;
if (i >= count) return;
$(".show_list .box").filter(":visible").fadeOut(600).parent().children().eq(i).fadeIn(1200);
$(this).toggleClass("on");
$(this).siblings().removeAttr("class");
});
t = setInterval("showAuto()", 3500);
$(".roll").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()",3500);});
});
function showAuto(){
n = n >=(count - 1) ? 0 : ++n;
$(".roll li").eq(n).trigger('click');
}
</script>
</head>

<body>
<div class="roll">
  <ul>
    <li class="on"> 1 </li>
    <li> 2 </li>
    <li> 3 </li>
    <li> 4 </li>
  </ul>
  <div class="show_list">
    <DIV class=box><img src="static/image/c1.png" /></DIV>
    <DIV class=box><img src="static/image/c1.png" /></DIV>
    <DIV class=box><img src="static/image/c1.png" /></DIV>
    <DIV class=box><img src="static/image/c1.png" /></DIV>
  </div>
</div>
</body>
</html>