<%@ page language="java" pageEncoding="utf-8" import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 01//EN" "http://www.worg/TR/html4/strict.dtd">   
<html>
<head>
    <title><%=LocalizationUtil.getClientString("SEO.Title", request) %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="<%=LocalizationUtil.getClientString("SEO.Keywords", request) %>">
	<meta http-equiv="description" content="<%=LocalizationUtil.getClientString("SEO.Description", request) %>">
<link rel="stylesheet" type="text/css" href="<%=CSS_PATH %>global.css">
<link rel="stylesheet" type="text/css" href="<%=CSS_PATH %>front.css">
</head>
<body>
<div class="container clearfix">
	<div class="toolBarWrap  clearfix">
		<ul>
			<li><a href="#" class="tool tool_1"></a></li>
			<li><a href="#" class="tool tool_2"></a></li>
			<li><a href="#" class="tool tool_3"></a></li>
			<li><a href="#" class="tool tool_4"></a></li>
			<li><a href="#" class="tool tool_5"></a></li>
			<li><a href="#" class="tool tool_6"></a></li>
			<li><a href="#" class="tool tool_7"></a></li>
		</ul>
	</div>
	<div class="tool_control_container  clearfix">
		<div class="left_wrap">
			<div class="weatherInfo"> 
				<p class="position">地点</p>
				<div class="detailInfo">
					<p>
						<span class="condition">晴</span>
						<span class="temperature">10</span>	
					</p>
				</div>
				<div class="weatherImg">
					<img src="<%=IMAGE_PATH %>weather.png" alt="img">
				</div>
				<div class="dataInfo">
					<p class="pm">PM</p>
					<p class="data">2013-12-21 星期三</p>
				</div>
			</div>
			<div class="controlContainer">
			   <ul>
					<li><a href="#" class="tool_control tool_control_1"></a></li>
					<li><a href="#" class="tool_control tool_control_2"></a></li>
					<li><a href="#" class="tool_control tool_control_3"></a></li>
					<li><a href="#" class="tool_control tool_control_4"></a></li>
					<li><a href="#" class="tool_control tool_control_5"></a></li>
					<li><a href="#" class="tool_control tool_control_6"></a></li>
					<li><a href="#" class="tool_control tool_control_7"></a></li>
					<li><a href="#" class="tool_control tool_control_8"></a></li>
			    </ul>
		   </div>
		</div>
	   <div class="enter">
			<a href="index.do" class="enter_index">Enter</a> 
		</div>
	</div>
</div>
<script type="text/javascript" src="<%=JS_PATH %>jquery.js"></script>
<script type="text/javascript" src="<%=JS_PATH %>front.js"></script>
</body>
</html>