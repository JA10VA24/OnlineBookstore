<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>头部</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/skin.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
  </head>
  
  <body>
    <!-- 上部：导航加搜索 -->
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<c:choose>
				<c:when test="${empty user }">
					<div class="message-l">
						<div class="topMessage">
							<div class="menu-hd">
								<a href="${pageContext.request.contextPath }/pages/before/user/login.jsp" target="_top" class="h">亲，请登录</a> 
								<a href="${pageContext.request.contextPath }/pages/before/user/regist.jsp" target="_top">免费注册</a>
							</div>
						</div>
					</div>
					<div class="message-r">
						<div class="topMessage home">
							<div class="menu-hd">
								<a href="${pageContext.request.contextPath }/index.jsp " target="_top" class="h">书城首页</a>
							</div>
						</div>
						<div class="topMessage my-shangcheng">
							<div class="menu-hd MyShangcheng">
								<a
									href="${pageContext.request.contextPath }/pages/before/user/login.jsp "
									target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a>
							</div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd">
								<a id="mc-menu-hd"
									href="${pageContext.request.contextPath }/pages/before/user/login.jsp "
									target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
									id="J_MiniCartNum" class="h"></strong></a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="message-l">
						<div class="topMessage">
							<div class="menu-hd">
								<a href="" target="_top" class="h">欢迎光临我的网上书城店</a>
							</div>
						</div>
					</div>
					<div class="message-r">
						<div class="topMessage home">
							<div class="menu-hd">
								<a href="#" target="_top" class="h">您好：${user.username }</a>
							</div>
						</div>
						<div class="topMessage my-shangcheng">
							<div class="menu-hd MyShangcheng">
								<a href="<c:url value='/OrderServlet?method=myOrder' />" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a>
							</div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd">
								<a id="mc-menu-hd" href="${pageContext.request.contextPath }/pages/before/product/cartList.jsp" target="_top"><i
									class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
							</div>
						</div>
						<div class="topMessage favorite">
							<div class="menu-hd">
								<a href="${pageContext.request.contextPath }/UserServlet?method=quit" target="_top"><i
									class="am-icon-heart am-icon-fw"></i><span>退出</span></a>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logo">
				<img src="${pageContext.request.contextPath }/images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img
					src="${pageContext.request.contextPath }/images/logo.png" /></li>
			</div>

			<div class="search-bar pr">
				<form action="<c:url value='/BookServlet'/>" method="post">
					<input type="hidden" name="method" value="findByKeyword">
					<input id="searchInput" name="bookName" type="text" placeholder="搜索" autocomplete="off"> 
					<input id="ai-topsearch" class="submit am-btn" value="搜索"  type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
<!-- 上部结束 -->

  </body>
</html>
