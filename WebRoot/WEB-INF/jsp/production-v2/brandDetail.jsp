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

		<div class="row2-product">

			<div class="moduletable-banner-product">
				<div class="ad-text"
					style="height:374px; overflow:hidden; display:none;">
					<%
						if(LocalizationUtil.getLocale(request).equals(Locale.CHINA)){
					%>
					${currentProductDTO.infoPrd}
					<%
						} else {
					%>
					${currentProductDTO.infoEnPrd}
					<%
						}
					%>
				</div>
				<div class="p-left-slides"></div>
				<div class="p-right-slides"></div>
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
				<input type="hidden" id="productNum" name="productNum" value="${productNum}"/>
				<div class="Cont" id="ISL_Cont">
					<div class="ScrCont">
						<div id="List1">
							<!-- 图片列表 begin -->
							<c:forEach items="${productDTOList}" var="productDTO">
								<c:choose>
									<c:when test="${productDTO.idPrd==currentProductDTO.idPrd}">
										<div class="pic">
											<a
												href="brand.do?action=detail&id=${brandDTO.idBrd}&pId=${productDTO.idPrd}"><img
												src="${productDTO.logoPathPrd}"
												alt="${productDTO.logoNamePrd}"
												onload="imagezoom.call(this, 175, 85);" style="opacity:1;" /></a>
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
						<!--
						<div id="List2">
							<!-- 图片列表 begin -->
						<!-- 图片列表 end -->
						<!--
						</div>
						-->
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
	</div>
	<%@ include file="common/footer.jsp"%>

	<script type="text/javascript"
		src="<%=JS_PATH%>jquery.flexslider.min.js"></script>
	<script type="text/javascript"
		src="<%=JS_PATH%>slider-controller.js"></script>
	
</body>
</html>