<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--头部-->
		<div class="header">
			<div class="logo">
				<a href="/sister/"><img src="<%=IMAGE_PATH%>logo.png" /></a>
			</div>
            <div class="nav">
            <a href="news.do" class='<%=navBar.get("news")%>'><%=LocalizationUtil.getClientString("Nav.news", request) %></a>
            <a href="about.do" class='<%=navBar.get("about")%>'><%=LocalizationUtil.getClientString("Nav.about", request) %></a>
            <a href="contact.do" class='<%=navBar.get("contact")%>'><%=LocalizationUtil.getClientString("Nav.contact", request) %></a>
            <a href="#"><%=LocalizationUtil.getClientString("Nav.share", request) %></a>
            </div>
		</div>
        <!--头部 end-->