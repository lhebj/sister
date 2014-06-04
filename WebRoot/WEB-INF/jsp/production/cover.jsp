<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="common/common.jsp"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 01//EN" "http://www.worg/TR/html4/strict.dtd">
<html>
<head>
<title><%=LocalizationUtil.getClientString("SEO.Title", request)%></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords"
	content="<%=LocalizationUtil.getClientString("SEO.Keywords", request)%>">
<meta http-equiv="description"
	content="<%=LocalizationUtil.getClientString("SEO.Description", request)%>">
<link rel="stylesheet" type="text/css"
	href="<%=CSS_PATH%>/cover.css?version=<%=version%>" />
<style>
html,body {
	height: 100%
}
</style>
</head>
<body>
	<div class="main-section">
		<div style="overflow:hidden;position:relative;width:100%;height:100%;">
			<div class="img-item" id="image1" style="display:none">
				<div class="img-wrapper">
					<img src="<%=IMAGE_PATH%>c1.png" />
				</div>
			</div>
			<div class="img-item" id="image2" style="display:none">
				<div class="img-wrapper">
					<img src="<%=IMAGE_PATH%>c2.png" />
				</div>
			</div>
			<div class="img-item" id="image3" style="display:none">
				<div class="img-wrapper">
					<img src="<%=IMAGE_PATH%>c3.png" />
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=JS_PATH%>jquery.js"></script>
	<script type="text/javascript" src="<%=JS_PATH%>cover.js"></script>
</body>
</html>