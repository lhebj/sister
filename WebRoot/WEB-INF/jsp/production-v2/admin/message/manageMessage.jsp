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
		<h1>留言管理</h1>
	</div>
	<table class="table table-bordered table-condensed table-hover"
		style="width: 100%;">
		<tr>
			<td width="10%">留言时间</td>
			<td width="10%">ip</td>
			<td width="60%">留言内容</td>
			<td width="10%">操作</td>
		</tr>
		<tbody>
			<c:forEach items="${messageDTOList}" var="messageDto">
				<tr>
					<td>${messageDto.dateCreateMsg}</td>
					<td>${messageDto.ipMsg}</td>
					<td>${messageDto.messageMsg}</td>
					<td><a
						href="messageAdmin.do?action=delete&id=${messageDto.idMsg}"  onclick="javascript:return del_sure()">刪除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	${pageutil}



	<%@ include file="../homeFoot.jsp"%>
</body>
</html>
