<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/common.jsp" %>
<% navBar.put("contact", "nav  current"); %>
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
<link rel="stylesheet" type="text/css" href="<%=CSS_PATH %>contact.css">
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
				<div class="address_container">
					<!-- 
					<div class="time">
						<p>工作时间</p>
						<p>周一到周五</p>
						<p>09:00-18:00</p>
					</div>
					<div class="phone">
						<p>电话</p>
						<p>010-60258878</p>
						<p>传真</p>
					</div>
					<div class="email">
						<p>邮件</p>
						<p>beijng@poss.com.cn</p>
					</div>
					 -->
					 ${contact.contentAb}
				</div>
				<div class="map_address">
					<!-- <img src="<%=IMAGE_PATH %>map_address.png"/> -->
					<div id="my_address">
						<iframe width="604" height="465" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://j.map.baidu.com/Y9cFr"></iframe>
					</div>
					<p class="callout">
						地图位标注仅供参考，具体情况以实际位置为主
					</p>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
