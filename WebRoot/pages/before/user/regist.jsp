<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
	<link href="${pageContext.request.contextPath }/css/dlstyle.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<style type="text/css">
	#loginPhoto {margin-top: 50px;}
	#tip {margin-left: 165px;margin-top: -8;}
	#text1 {font-size: 13px;color: gray;font-weight: normal}
	#a {color: #46a3ff}
	#msg {margin-left: 93px; margin-bottom: -10px}
	#msg1 {margin-left: 10px;}
	span {font-weight: 900;color: red;font-size: 14px;}
</style>
  </head>
  
  <body>
	<div class="login-boxtitle">
		<a href="home/demo.html">
		<img alt="" src="${pageContext.request.contextPath }/images/logo.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<img id="loginPhoto"
					src="${pageContext.request.contextPath }/images/login2.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">账号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
					  <form action="${pageContext.request.contextPath }/UserServlet" method="post">
					  	<input type="hidden" name="method" value="regist">
						<div class="am-tab-panel am-active">
							<div class="user-name">
								<label for="user"><i class="am-icon-user"></i></label> 
								<input type="text" name="username" id="user" placeholder="账号" value="${user.username }">
							</div>
							<div class="user-pass">
								<label for="password"><i class="am-icon-lock"></i></label> 
								<input type="password" name="password" id="password" placeholder="设置密码" value="${user.password }" />
							</div>
							<div class="user-pass">
								<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								<input type="password" name="password2" id="passwordRepeat" placeholder="确认密码" value="${password2 }">
							</div>
							<div class="user-email">
								<label for="email"><i class="am-icon-envelope-o"></i></label> 
								<input type="email" name="email" id="email" placeholder="邮箱" value="${user.email }">
							</div>
							<div id="tip">
               					<span id="text1">已有账号？</span><a href="${pageContext.request.contextPath }/pages/before/user/login.jsp" id="a">立即登录</a> 
               				</div>
               				<br/>
                			<span id="msg">${map.username}${map.password }${map.password2 }${map.email }</span>
                			<span id="msg1">${msg }</span>
               				<br/>
							<div class="am-cf">
								<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>
						</div>
					</form>
				</div>
	<script>
		$(function() {
					 $('#doc-my-tabs').tabs();
				});
	</script>
				</div>
			</div>

		</div>
	</div>

<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">关于我们</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> 
			</p>
		</div>
		<div class="footer-bd ">
			<p> 
				<a href="# ">书城首页</a> <em>© 2017 安庆师范大学 卓越（1）班 版权所有. 
				<a href="" target="_blank" title="author">
				</a>- Design By <a href="#" title="author" target="_blank">Koshi</a></em>
			</p>
		</div>
	</div>
</body>
</html>
