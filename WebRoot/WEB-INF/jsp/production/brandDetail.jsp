<%@ page language="java" pageEncoding="utf-8" import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="common/common.jsp" %> 
<c:set var="nameBrd" value="${brandDetailDTO.nameBrd}" scope="page"></c:set>
<% navBar.put("brand", "selected"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title><%=LocalizationUtil.getClientString("SEO.Title", request) %></title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="<%=LocalizationUtil.getClientString("SEO.Keywords", request) %>">
	<meta http-equiv="description" content="<%=LocalizationUtil.getClientString("SEO.Description", request) %>">
	<!--css文件-->
	<link rel="stylesheet" type="text/css" href="<%=CSS_PATH%>global.css">
	<link rel="stylesheet" type="text/css" href="<%=CSS_PATH%>classify.css">
  </head>
  
  <body>

	  <%@ include file="common/head.jsp" %>
	  
	   <!-- 品牌详情页面logo 和 简介 -->
	  	<!-- <p><img src="${brandDetailDTO.logoPath}" /></p>
	  	<p>
	  				${brandDetailDTO.introductionBrdd}
	  			</p> -->
		
		<!--左侧导航   有左侧导航去掉listContainer style="width:990px;"-->
		<!-- <div class="leftside clearfix">
			<ul>
				<li class="aside_nav">
					<a class="classification" href="Brand.html">品牌</a>
					<div class="submenubox">
						<div class="subcate">
							<ul>
								<li><a href="javascript:;">分类</a></li>
								<li><a href="javascript:;">分类</a></li>
								<li><a href="javascript:;">分类</a></li>
								<li><a href="javascript:;">分类</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="aside_nav">
					<a class="classification" href="classify.html">分类</a>
					<div class="submenubox">
						<div class="subcate">
							<ul>
								<li><a href="javascript:;">分类</a></li>
								<li><a href="javascript:;">分类</a></li>
								<li><a href="javascript:;">分类</a></li>
								<li><a href="javascript:;">分类</a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div> -->
		<!-- 品牌下的产品列表 -->
		<div class="listContainer" style="width:990px;">
			<ul>
			<c:forEach items="${productDTOList}" var="productDTO">
			    <li>
					<div class="listWrap">
						<a href="product.do?action=detail&id=${productDTO.idPrd}">
							<img src="${productDTO.logoPath}" alt="img">
					    </a>
						<div class="toolInfo">
							<p class="detailInfo">${productDTO.namePrd}</p>
							<p class="detailInfo">${productDTO.modelPrd}</p>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	    ${pageutil}	
	    <%@ include file="common/footer.jsp" %>

  </body>
</html>
