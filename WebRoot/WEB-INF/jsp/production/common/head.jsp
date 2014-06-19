<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--头部-->
		<div class="header">
			<div class="logo">
				<a href="/"><img height="194" width="277" src="<%=IMAGE_PATH%>logo.png" /></a>
			</div>
            <div class="nav">
            <a href="news.do">News</a>
            <a href="about.do" class="thisr">About</a>
            <a href="contact.do">Contact</a>
            <a href="#">Share</a>
            </div>
		</div>
        <!--头部 end-->