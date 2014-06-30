<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil,com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="common/common.jsp"%>
<% navBar.put("news", "thisr"); %>
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
	
<link href="<%=CSS_PATH%>layout.css?version=<%=version%>" type="text/css" rel="stylesheet" charset="utf-8" />
</head>

<body class="bg_img">
	<%@ include file="common/head.jsp"%>
	<div class="content">
        <div class="row1">
        	<div class="about_img">
        		<img width="468"  height="422" src="${news.picPath}" />
        	</div>
            <div class="about_text">
           		${news.contentAb}
            </div>
        
        </div>
	</div>
	<script type="text/javascript" src="<%=JS_PATH%>jquery.min.js"></script>
</body>
</html>