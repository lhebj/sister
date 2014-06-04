<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil,com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title><%=LocalizationUtil.getClientString("Title.admin", request)%></title>
<link rel="stylesheet" type="text/css"
	href="assets/lib/blueprint/screen.css" media="screen, projection" />
<link rel="stylesheet" type="text/css"
	href="assets/lib/blueprint/print.css" media="print" />
<!--[if lt IE 8]><link rel="stylesheet" href="assets/lib/blueprint/ie.css" type="text/css" media="screen, projection" /><![endif]-->
<link rel="stylesheet" href="assets/css/jquery.wysiwyg.css"
	type="text/css" />
<script type="text/javascript" src="assets/lib/jquery.js"></script>
<script type="text/javascript" src="assets/js/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="assets/js/controls/wysiwyg.image.js"></script>
<script type="text/javascript" src="assets/js/controls/wysiwyg.link.js"></script>
<script type="text/javascript" src="assets/js/controls/wysiwyg.table.js"></script>

<script type="text/javascript">
	(function($) {
		$(document)
				.ready(
						function() {
							$('#infoPrd')
									.wysiwyg(
											{
												controls : {
													bold : {
														visible : true
													},
													italic : {
														visible : true
													},
													underline : {
														visible : true
													},
													strikeThrough : {
														visible : true
													},

													justifyLeft : {
														visible : true
													},
													justifyCenter : {
														visible : true
													},
													justifyRight : {
														visible : true
													},
													justifyFull : {
														visible : true
													},

													indent : {
														visible : true
													},
													outdent : {
														visible : true
													},

													subscript : {
														visible : true
													},
													superscript : {
														visible : true
													},

													undo : {
														visible : true
													},
													redo : {
														visible : true
													},

													insertOrderedList : {
														visible : true
													},
													insertUnorderedList : {
														visible : true
													},
													insertHorizontalRule : {
														visible : true
													},

													h4 : {
														visible : true,
														className : 'h4',
														command : ($.browser.msie || $.browser.safari) ? 'formatBlock'
																: 'heading',
														arguments : ($.browser.msie || $.browser.safari) ? '<h4>'
																: 'h4',
														tags : [ 'h4' ],
														tooltip : 'Header 4'
													},
													h5 : {
														visible : true,
														className : 'h5',
														command : ($.browser.msie || $.browser.safari) ? 'formatBlock'
																: 'heading',
														arguments : ($.browser.msie || $.browser.safari) ? '<h5>'
																: 'h5',
														tags : [ 'h5' ],
														tooltip : 'Header 5'
													},
													h6 : {
														visible : true,
														className : 'h6',
														command : ($.browser.msie || $.browser.safari) ? 'formatBlock'
																: 'heading',
														arguments : ($.browser.msie || $.browser.safari) ? '<h6>'
																: 'h6',
														tags : [ 'h6' ],
														tooltip : 'Header 6'
													},

													cut : {
														visible : true
													},
													copy : {
														visible : true
													},
													paste : {
														visible : true
													},
													html : {
														visible : true
													},
													increaseFontSize : {
														visible : true
													},
													decreaseFontSize : {
														visible : true
													},
													exam_html : {
														exec : function() {
															this
																	.insertHtml('<abbr title="exam">Jam</abbr>');
															return true;
														},
														visible : true
													}
												},
												events : {
													click : function(event) {
														if ($("#click-inform:checked").length > 0) {
															event
																	.preventDefault();
															alert("You have clicked jWysiwyg content!");
														}
													}
												}
											});
						});
	})(jQuery);
</script>

</head>

<body>
	<%@ include file="../homeHead.jsp"%>


	<div class="page-header">
		<h1>添加或编辑产品</h1>
	</div>
	<FORM class="form-horizontal" name="form1" METHOD="POST"
		ACTION="productAdmin.do?action=save" ENCTYPE="multipart/form-data">
		<input name="id" type="hidden" value="${productDTO.idPrd}" />
		<table>
			<tr>
				<td width='60'>所属品牌</td>
				<td><select class="selectpicker" name="idbrdPrd">
						<c:forEach items="${brandDTOList}" var="brandDTO">
							<c:if test="${brandDTO.idBrd != selectedBrandId}">
								<option value="${brandDTO.idBrd}">${brandDTO.nameBrd}</option>
							</c:if>
							<c:if test="${brandDTO.idBrd == selectedBrandId}">
								<option value="${brandDTO.idBrd}" selected>${brandDTO.nameBrd}</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width='60'>产品名称</td>
				<td><input name="namePrd" type="text"
					style="width:900px;height:30px" value="${productDTO.namePrd}" /></td>
			</tr>
			<tr>
				<td width='60'>产品信息</td>
				<td>
					<textarea id="infoPrd" style="width:900px;height:200px"
						name="infoPrd" >${productDTO.infoPrd}</textarea></td>
			</tr>
			<tr>
				<td width='60'>logo图片</td>
				<td><input name="logo" type="FILE" id="logo" size="50" />
					${productDTO.logoName}</td>
			</tr>
			<tr>
				<td width='60'>产品图片</td>
				<td>
					<table id="downloadFileTable">
						<tr>
							<td style="width:300px;">图片描述</td>
							<td>上传文件</td>
							<td>操作</td>
						</tr>

						<c:forEach items="${productPicDTOList}" var="productPicDTO">
							<tr>
								<td>${productPicDTO.infoPrdp}</td>
								<td>${productPicDTO.fileNamePrdp}</td>
								<td><input type="button" value="删除"
									onclick="DeleteOldFile(${productPicDTO.idPrdp},event)" /></td>
							</tr>
						</c:forEach>

					</table> <input id="deleteOldFilesId" name="deleteOldFiles" type="hidden" />
					<input type="button" value="添加一行新的下载文件" onclick="AddNewFile()" />
				</td>
			</tr>
			<tr>
				<td width='60'></td>
				<td><input class="btn btn-primary" name="ok" type="submit"
					value="提交"> <input type="button" value="取消" class="btn"
					onclick="javascript:window.history.go(-1);" /></td>
			</tr>

		</table>
	</form>

	<script src="assets/js/sister/productpic.js"></script>
	<%@ include file="../homeFoot.jsp"%>
</body>
</html>
