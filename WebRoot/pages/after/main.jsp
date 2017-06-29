<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>   
  </head>
  
  <body style="background-color:#f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="${pageContext.request.contextPath }/images/backlogo.jpg" class="radius-circle rotate-hover"
					height="50" alt="" />后台管理中心
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="<c:url value='/index.jsp'/>" target="_blank">
			<span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
			 &nbsp;&nbsp;
			<a class="button button-little bg-red" href="<c:url value='/AdminLoginServlet?method=quit'/>"><span class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>图书管理
		</h2>
		<ul style="display:block">
			<li><a href="<c:url value='/AdminBookServlet?method=addPre'/>" target="right"><span
					class="icon-caret-right"></span>添加图书</a></li>
			<li><a href="<c:url value='/AdminBookServlet?method=findAll'/>" target="right"><span
					class="icon-caret-right"></span>查看图书</a></li>
		</ul>
		<h2>
			<span class="icon-user"></span>分类管理
		</h2>
		<ul>
			<li><a href="<c:url value='/AdminCategoryServlet?method=findAll'/>" target="right"><span
					class="icon-caret-right"></span>查看分类</a></li>
			<li><a href="<c:url value='/pages/after/addCategory.jsp'/>" target="right"><span
					class="icon-caret-right"></span>添加分类</a></li>
		</ul>
		<h2>
			<span class="icon-user"></span>订单管理
		</h2>
		<ul>
			<li><a href="<c:url value='/AdminOrderServlet?method=findAllOrder'/>" target="right"><span
					class="icon-caret-right"></span>所有订单</a></li>
			<li><a href="<c:url value='/AdminOrderServlet?method=findByOrderState&orderState=1'/>" target="right"><span
					class="icon-caret-right"></span>未付款订单</a></li>
			<li><a href="<c:url value='/AdminOrderServlet?method=findByOrderState&orderState=2'/>" target="right"><span
					class="icon-caret-right"></span>已付款订单</a></li>
			<li><a href="<c:url value='/AdminOrderServlet?method=findByOrderState&orderState=4'/>" target="right"><span
					class="icon-caret-right"></span>已完成订单</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="{:U('Index/info')}" target="right" class="icon-home">
				首页</a></li>
		<li><a href="##" id="a_leader_txt">网站信息</a></li>
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="info.jsp" name="right"
			width="100%" height="100%"></iframe>
	</div> 

</body>
</html>
