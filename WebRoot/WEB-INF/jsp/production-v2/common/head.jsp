<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<%=JS_PATH%>globle.js?version=<%=version%>"></script>
<!--头部-->
		<div class="header">
			<div class="logo">
				<a href="/"><img src="<%=IMAGE_PATH%>logo-new.png" /></a>
			</div>
			<%if(LocalizationUtil.getLocale(request).equals(Locale.CHINA)){ %>
			<div class="navZh">
			<%}else{ %>
			<div class="nav">
			<%} %>
            
            	<a href="news.do" class='<%=navBar.get("news")%> aclass'><%=LocalizationUtil.getClientString("Nav.news", request) %></a>
            	<a href="about.do" class='<%=navBar.get("about")%> aclass'><%=LocalizationUtil.getClientString("Nav.about", request) %></a>
            	<a href="contact.do" class='<%=navBar.get("contact")%> aclass'><%=LocalizationUtil.getClientString("Nav.contact", request) %></a>
            	<a href="javascript:void(0)" onclick="navShareClick()" class='aclass' ><%=LocalizationUtil.getClientString("Nav.share", request) %></a>
            	<div class="share-icon" id="shareIcon">
            		<a href="#" class="share-a"><img src="<%=IMAGE_PATH%>weibo.png"></a>
            		<a href="#" class="share-a"><img src="<%=IMAGE_PATH%>weixin.png"></a>
           		</div>
            </div>
            
            
		</div>
        <!--头部 end-->