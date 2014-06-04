<%@ page language="java" pageEncoding="utf-8" import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="common/common.jsp" %>
<% navBar.put("news", "nav  current"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 01//EN" "http://www.worg/TR/html4/strict.dtd">   
<html>
  <head>
    <base href="<%=BASE_Path%>">
	<title>${currentNewsDTO.titleN}-<%=LocalizationUtil.getClientString("SEO.Title", request) %></title>    
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
		<div class="content clearfix">
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
				<div class="newsWrap">
					<ul>
						<c:forEach items="${newsSimpleDtoList}" var="newsDto">
						<li><a class="news_list" href="news.do?id=${newsDto.idN}">${newsDto.titleN}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="listContainer clearfix">
				<div>${currentNewsDTO.titleN}</div>
	    		<div><img src="${currentNewsDTO.pic}"></div>
	    		<div>${currentNewsDTO.contentN}</div>
			</div>
		</div>
	</div>
	
</body>
</html>
