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
	content="<%=LocalizationUtil.getClientString("SEO.Keywords", request)%>">
<meta http-equiv="description"
	content="<%=LocalizationUtil.getClientString("SEO.Description", request)%>">
	
<script type="text/javascript" src="<%=JS_PATH%>jquery.min.js"></script>
<link href="<%=CSS_PATH%>layout.css?version=<%=version%>" type="text/css" rel="stylesheet" charset="utf-8">
<script>
$(document).ready(function(){
 

    $(".load_logo").fadeIn(6000,function(){
		//location.href = "index.html";
		$('.chn_en_btn').fadeIn(1000);
		});
	
  
});
</script>
</head>

<body class="bg_img">
<div class="load_logo">
<img src="<%=IMAGE_PATH%>load-logo.png" />
</div>

<div class="chn_en_btn" style="display:none;">

<a href="#" style="float:left;">EN</a>
<a href="#" style="float:right;">中文</a>
</div>
</body>
</html>
