<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${pageContext.request.contextPath }/css/dlstyle.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
	#loginPhoto {margin-top: 50px;}
	#tip {margin-left: 190px;margin-top: 1;}
	#text1 {font-size: 13px;color: gray;font-weight: normal}
	#a {color: #46a3ff}
	#msg {margin-left: 120px;}
	#msg1 {margin-left: 60px;}
	span {font-weight: 400;color: red}
</style>
</head>

<body>
	<div class="login-boxtitle">
		<a href="home.html"><img alt="logo" src="${pageContext.request.contextPath }/images/logo.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img id="loginPhoto" src="${pageContext.request.contextPath }/images/login2.jpg" />
			</div>
			<div class="login-box">

			<h3 class="title">登录网上书城</h3>

			<div class="clear"></div>

			<form action="${pageContext.request.contextPath }/UserServlet" method="post">
				<input type="hidden" name="method" value="login">
				<div class="login-form">
					<div class="user-name">
						<label for="user"><i class="am-icon-user"></i></label> 
						<input type="text" name="username" id="user" placeholder="账号" value="${user.username }">
					</div>
					<div class="user-pass">
						<label for="password"><i class="am-icon-lock"></i></label>
						<input type="password" name="password" id="password" placeholder="请输入密码" value="${user.password }">
					</div>
				</div>
				<div id="tip">
               		<span id="text1">还没账号？</span><a href="${pageContext.request.contextPath }/user/regist.jsp" id="a">立即注册</a> 
                </div>
				<br/>
                <span id="msg">${msg }${map.username }${map.password }</span>
                <br/>
				<div class="am-cf">
					<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm"/>
				</div>
			</form>
			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">关于我们</a> <b>|</b> <a href="${pageContext.request.contextPath }/index.jsp ">商城首页</a> <b>|</b> 
			</p>
		</div>
		<div class="footer-bd ">
			<p> 
				 <em>© 2017 安庆师范大学 卓越（1）班 版权所有. 
				 <a href="${pageContext.request.contextPath }/pages/before/user/login.jsp" target="_blank" title="author"></a>
					- Design By <a href="#" title="author"
					target="_blank">Koshi</a></em>
			</p>
		</div>
	</div>


</body>
</html>
