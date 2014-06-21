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
<link rel="stylesheet" type="text/css"
	href="assets/lib/blueprint/screen.css" media="screen, projection" />
<link rel="stylesheet" type="text/css"
	href="assets/lib/blueprint/print.css" media="print" />
<script type="text/javascript" src="assets/lib/jquery.js"></script>

</head>

<body>
	<%@ include file="../homeHead.jsp"%>

	<div class="page-header">
		<h1>添加或编辑品牌</h1>
	</div>
	<FORM class="form-horizontal" name="form1" METHOD="POST"
		ACTION="brandAdmin.do?action=save" ENCTYPE="multipart/form-data">
		<input name="id" type="hidden" value="${brandDTO.idBrd}" />
		<table>
			<tr>
				<td width='160'>品牌名称</td>
				<td><input name="nameBrd" type="text"
					style="width:800px;height:30px" value="${brandDTO.nameBrd}" /></td>
			</tr>
			<tr>
				<td width='160'>logo图片<br>(最佳大小 1054 * 621)</td>
				<td><input name="pic" type="FILE" id="pic" size="50" />${brandDTO.picName}</td>
			</tr>
			<tr>
				<td width='160'></td>
				<td><input class="btn btn-primary" name="ok" type="submit"
					value="提交"> <input type="button" value="取消" class="btn"
					onclick="javascript:window.history.go(-1);" /></td>
			</tr>

		</table>
	</form>

	<%@ include file="../homeFoot.jsp"%>
</body>
</html>
