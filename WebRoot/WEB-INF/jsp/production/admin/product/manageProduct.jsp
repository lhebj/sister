<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil,com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

    <title><%=LocalizationUtil.getClientString("Title.admin", request) %></title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<%@ include file="../homeHead.jsp"%>

	<div class="page-header">
		<h1>产品管理</h1>
		<c:if test="${brandDTO != null}">
			<h3>所属品牌： ${brandDTO.nameBrd}</h3>
		</c:if>
		
	</div>
	<div>
		<a href="admin.do?action=postProduct&brandId=${brandDTO.idBrd}"><button
				style="width: 82px;" class="btn btn-primary" type="button">添加产品</button></a>
	</div>
	<table class="table table-bordered table-condensed table-hover"
		style="width: 100%;">
		<thread>
		<tr>
			<td >产品名</td>
			<td >logo</td>
			<td >操作</td>
		</tr>
		</thread>
		<tbody>
			<c:forEach items="${productDTOList}" var="productDTO">
				<tr>
					<td><a href="brand.do?action=detail&pId=${productDTO.idPrd}">${productDTO.namePrd}</a></td>
					<td><a href="brand.do?action=detail&pId=${productDTO.idPrd}"><img
							src="${productDTO.logoPathPrd}"></img></a></td>
					<td><a
						href="admin.do?action=postProduct&id=${productDTO.idPrd}"><button
								style="width: 82px;" class="btn btn-primary" type="button">编辑</button></a>
						<a
						href="productAdmin.do?action=delete&id=${productDTO.idPrd}"  onclick="javascript:return del_sure()"><button
								style="width: 82px;" class="btn btn-primary" type="button">删除</button></a></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	${pageutil}

	<%@ include file="../homeFoot.jsp"%>
</body>
</html>
