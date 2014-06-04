<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp" %>
<% navBar.put("about", "nav  current"); %>
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
<link rel="stylesheet" type="text/css" href="<%=CSS_PATH %>global.css">
<link rel="stylesheet" type="text/css" href="<%=CSS_PATH %>news.css">
</head>
<body>
	<div class="container clearfix">
		<%@ include file="common/head.jsp" %>
		<div class="content">
			<div class="leftside clearfix">
				<ul>
				<li class="aside_nav">
						<a class="classification" name="brand" href="javascript:;">品牌</a>
						<div class="submenubox">
							<div class="subcate">
								<ul>
									<c:forEach items="${brandTreeCache}" var="brandDTOEntry">
										<li>
											<span class="sort_title">${brandDTOEntry.key}</span>
											<div class="detail">
												<c:forEach items="${brandDTOEntry.value}" var="brandDTO">
												<a href="javascript:;" data-id="" class="item">${brandDTO.nameBrd}</a>
												</c:forEach>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</li>
					<li class="aside_nav">
						<a class="classification" name="classify" href="javascript:;">分类</a>
						<div class="submenubox">
							<div class="subcate">
								<ul>
									<c:forEach items="${categoryTreeCache}" var="categoryDTO">
										<li><a href="javascript:;" class="item" data-id="${categoryDTO.idCat}">${categoryDTO.nameCat}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="listContainer clearfix">
				${about.contentAb }
			</div>
		</div>
		
	</div>

	
</body>
</html>
