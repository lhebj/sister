<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*,com.sister.web.util.WebUtil, com.sister.web.util.LocalizationUtil,com.sister.web.util.BrandUtil,com.sister.web.util.CategoryUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="brandTreeCache" value="<%=BrandUtil.getBrandTree()%>" scope="page" />
<c:set var="categoryTreeCache" value="<%=CategoryUtil.getCategoryTree()%>" scope="page" />
<script type="text/javascript" src="<%=JS_PATH %>jquery.js"></script>
<script type="text/javascript" src="<%=JS_PATH %>header.js"></script>
<div class="logo"></div>
		<div class="headerWrap clearfix">
			<div class="navContainer">
				<ul>
					<li><a href="index.do" class='<%=navBar.get("index")%>'><%=LocalizationUtil.getClientString("Nav.index", request) %></a></li>
					<li><a href="news.do" class='<%=navBar.get("news")%>'><%=LocalizationUtil.getClientString("Nav.news", request) %></a></li>
					<li><a href="javascript:;" id="J_brand" class='<%=navBar.get("brand")%>'><%=LocalizationUtil.getClientString("Nav.brand", request) %></a></li>
					<li><a href="javascript:;" id="J_classify" class='nav'><%=LocalizationUtil.getClientString("Nav.category", request) %></a></li>
					<li><a href="training.do" class='<%=navBar.get("training")%>'><%=LocalizationUtil.getClientString("Nav.training", request) %></a></li>
					<li><a href="other.do" class='<%=navBar.get("other")%>'><%=LocalizationUtil.getClientString("Nav.other", request) %></a></li>
					<li><a href="about.do" class='<%=navBar.get("about")%>'><%=LocalizationUtil.getClientString("Nav.about", request) %></a></li>
					<li><a href="contact.do" class='<%=navBar.get("contact")%>'><%=LocalizationUtil.getClientString("Nav.contact", request) %></a></li>
				</ul>
			</div>
			<div class="searchWrap">
				<div class="rightAside">
					<span class="en"><a href="switchLan.do?lan=en">EN</a></span>
					<span class="cn"><a href="switchLan.do?lan=zh">CN</a></span>
					<a href="#" class="forum"><%=LocalizationUtil.getClientString("Forum", request) %></a>
					<%if(WebUtil.isGuest()){ %>
					<a class="userBtn registration" href="javascript:;"><%=LocalizationUtil.getClientString("Register", request) %></a>|
					<a class="userBtn login" href="javascript:;"><%=LocalizationUtil.getClientString("Login", request) %></a>
					<%}else{ %>
						<%=WebUtil.getUserId(request) %>|<a class="userBtn login" href="logout.do"><%=LocalizationUtil.getClientString("Logout", request) %></a>
					<%} %>
				</div>
				<div>
					<form name="form1" METHOD="POST" ACTION="product.do?action=list">
					<input type="text" class="searchText" name="wd" value="${wd}" />
					<input class="submitBtn" name="<%=LocalizationUtil.getClientString("Nav.search", request) %>" type= "submit" value="搜索"/>
					</form>
				</div> 
			</div>
	    </div>
	    <div class="wrap brand_submenubox">
			<div class="subcate">
				<ul>
					<c:forEach items="${brandTreeCache}" var="brandDTOEntry">
						<li>
							<span class="sort_title">${brandDTOEntry.key}</span>
							<div class="detail">
								<c:forEach items="${brandDTOEntry.value}" var="brandDTO">
								<a href="javascript:;" data-id="" class="nav_item">${brandDTO.nameBrd}</a>
								</c:forEach>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="wrap classify_submenubox">
			<div class="subcate">
				<ul>
					<c:forEach items="${categoryTreeCache}" var="categoryDTO">
						<li><a href="javascript:;" class="nav_item" data-id="${categoryDTO.idCat}">${categoryDTO.nameCat}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<!--注册 && 登陆-->
		<div class="registrationWrap">
			  <!--  <form name="form1" id="form1" method="POST">   -->
					<div class="registration_info">
						<h2>注册</h2>
						<p class="wrap">
							<label for=""><%=LocalizationUtil.getClientString("username", request) %></label>
							<input type="text" class="reg_txt userName">
							<span class="require_icon">*</span>
						</p>
						<p class="wrap">
							<label for=""><%=LocalizationUtil.getClientString("email", request) %></label>
							<input type="text" class="reg_txt email">
							<span class="require_icon">*</span>
						</p>
						<p class="wrap">
							<label for=""><%=LocalizationUtil.getClientString("weixin", request) %></label>
							<input type="text" class="reg_txt weiXin">
							<span class="require_icon">*</span>
						</p>
						<p class="wrap">
							<label for=""><%=LocalizationUtil.getClientString("password", request) %></label>
							<input type="password" class="reg_txt password">
							<span class="require_icon">*</span>
						</p>
						<p class="wrap">
							<label for=""><%=LocalizationUtil.getClientString("passwordConfirm", request) %></label>
							<input type="password" class="reg_txt rePassword">
							<span class="require_icon">*</span>
						</p>
						<!-- <p class="send_email">
							<input type="checkbox"><span>是的。请发送给我关于KNX MALL最新资料和优惠计划的电子邮件</span>
						</p>
						<p class="agreement">
							<input type="checkbox"><span>我同意KNX<a href="#">网页条款</a>和<a href="#">许可协议条款</a></span>
						</p> -->
						<p class="required">
							<span class="require_icon_des">*</span><span>必填信息</span>
						</p>
						<p id="tip" class="tip_error"></p>
						<a class="submit" href="javascript:void(0)">建立账号</a>
					</div>
			    <!-- </form> -->
				<div class="login_info">
					<h2>登陆</h2>
					<form class="form-horizontal" name="form1" method="POST" action="j_acegi_security_check">
					<p class="wrap">
						<label for="">用户名称</label>
						<input type="text" name="j_username">
					</p>
					<p class="wrap">
						<label for="">密码</label>
						<input type="text" name="j_password">
					</p>
					<c:if test="${type == 'fail'}">
					<span class="login_error">用户名或密码错误</span>
					</c:if>
					<button class="login_btn">登陆</button><span>忘记密码?</span>
					</form>
				</div>
			</div>
			<!-- 隐藏的iframe 表单注册登陆提交不刷新页面 -->
			<!-- <div id="sbIframeDiv" style="display: none;">
			   <iframe id="userFrame" name="sbIframe"></iframe>
			</div> -->

<!-- 
5.品牌（Brand）
5.1 前台
1）点击导航上的品牌，弹出品牌列表框
2）选择列表中的一个品牌，记住品牌id，然后弹出所有分类列表，选择一个分类，记住分类id，跳转到产品页，过滤出所有相关品牌和分类下的产品
5.2 后台
品牌管理：品牌列表，添加品牌，编辑品牌，删除品牌
品牌表单字段（品牌名称：name，品牌介绍：introduction）

6.分类（Category）
6.1 前台
1）点击导航上的分类，弹出分类列表框
2）选择列表中的一个分类，记住分类id，然后弹出所有品牌列表，选择一个品牌，记住分类id，跳转到产品页，过滤出所有相关品牌和分类下的产品
6.2 后台
分类管理：分类列表，添加分类，编辑分类，删除分类
分类表单字段（分类名称：name）

选择后跳转的连接为:brand.do?action=detail&id=1&categoryId=1
-->


<!-- 
<div>品牌</div>
<c:forEach items="${brandTreeCache}" var="brandDTOEntry">
	<div>${brandDTOEntry.key}</div>
	<c:forEach items="${brandDTOEntry.value}" var="brandDTO">
		<div>${brandDTO.nameBrd}</div>
	</c:forEach>
</c:forEach>
-->


<!-- 
<div>分类</div>
	<c:forEach items="${categoryTreeCache}" var="categoryDTO">
		<div><a href="brand.do?action=detail&id=1&categoryId=${categoryDTO.idCat}">${categoryDTO.nameCat}</a></div>
	</c:forEach>

 -->