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

<link href="<%=CSS_PATH%>layout.css?version=<%=version%>"
	type="text/css" rel="stylesheet" charset="utf-8" />
<style>
.include-center-load{

}
</style>
</head>

<body class="bg_img">

	<div class="include-center-load">
		Coming Soon!
	</div>
<!--
	<div class="include-center-load">
		<div class="load_logo">
			<img src="<%=IMAGE_PATH%>load-logo.png" />
		</div>

		<div class="chn_en_btn" style="display:none;">
			<a href="switchLan.do?lan=en"
				style="float:left; font-family: Arial; font-size:24px; font-weight:100">EN</a>
			<a href="switchLan.do?lan=zh"
				style="float:right; font-family: Arial; font-size:24px; font-weight:100">中文</a>
		</div>
	</div>
-->
	<%@ include file="common/footer.jsp"%>
	
<script>
	$(document).ready(function() {

		/**
		 $(".load_logo").fadeIn(3000, function() {
		 //location.href = "index.html";
		 $('.chn_en_btn').fadeIn(100);
		 });
		 **/
		$(".load_logo").fadeIn(3000, function() {
			//location.href = "index.html";

		});

		$('.chn_en_btn').fadeIn(5000);
	});
</script>
</body>
</html>
