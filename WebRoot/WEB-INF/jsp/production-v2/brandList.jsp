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
</head>

<body class="bg_img">
	<div class="include-center">
		<%@ include file="common/head.jsp"%>

		<div class="row2">

			<div class="moduletable-banner">
				<!-- 两边背景 -->
				<!-- 
			<div class="images-l"></div>
			<div class="images-r"></div>
		 -->
				<div class="left-slides"></div>
				<div class="right-slides"></div>
				<div class="flexslider">
					<ul class="slides">
						<c:forEach items="${brandDTOList}" var="brandDTO">
							<li><a href="brand.do?action=detail&id=${brandDTO.idBrd}">
									<img src="${brandDTO.picPath}" alt="${brandDTO.nameBrd}" />
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
	
<script type="text/javascript"
	src="<%=JS_PATH%>jquery.flexslider.min.js"></script>
	<script type="text/javascript"
		src="<%=JS_PATH%>brand-slider-controller.js"></script>
	
</body>
</html>