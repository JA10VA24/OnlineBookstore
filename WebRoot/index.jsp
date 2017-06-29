<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>欢迎光临我的网上书城</title>
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
	<jsp:include page="top.jsp"></jsp:include>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="index.jsp"><img
						src="${pageContext.request.contextPath }/images/lunbo1.png" /></a></li>
				<li class="banner2"><a href="index.jsp"><img
						src="${pageContext.request.contextPath }/images/lunbo2.jpg" /></a></li>
				<li class="banner3"><a href="index.jsp"><img
						src="${pageContext.request.contextPath }/images/lunbo3.jpg" /></a></li>
				<li class="banner4"><a href="index.jsp"><img
						src="${pageContext.request.contextPath }/images/lunbo4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="shopNav">
		<div class="slideall">
			<div class="long-title">
				<span class="all-goods">首页</span>
			</div>
			<div class="nav-cont">
				<ul>
					<c:forEach items="${category }" var="c">
						<li class="qc"><a href="<c:url value='/BookServlet?method=findByCategory&categoryName=${c.categoryName }&categoryId=${c.categoryId }'/>">${c.categoryName }</a></li>
					</c:forEach>
				</ul>

			</div>
		</div>
	</div>
	<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>

	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="${pageContext.request.contextPath }/images/logo2.png "></img>
					<p>
						热销<br>图书
					</p>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="recommendationMain one">
						<a href="<c:url value='/BookServlet?method=findById&bookId=5E7CCE8DB0464E7A8517C315401F69AB'/>"><img
							src="${pageContext.request.contextPath }/bookimages/bailuyuan.jpg "></a>
					</div>
					<div class="info ">
						<h3>白鹿原</h3>
						<h4>第四届茅盾文学奖</h4>
						<h4>￥49.9</h4>
					</div>

				</div>

				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>世界的凛冬</h3>
						<h4>《巨人陨落》续篇</h4>
						<h4>￥68.6</h4>
					</div>
					<div class="recommendationMain two">
						<a href="<c:url value='/BookServlet?method=findById&bookId=22F3EAFBCC8048E9B53D8676C593D814'/>">
						<img
							src="${pageContext.request.contextPath }/bookimages/shijie.jpg ">
						</a>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>与撒旦的约定</h3>
						<h4>布鲁诺.舒尔茨书信选</h4>
						<h4>￥46.0</h4>
					</div>
					<div class="recommendationMain three">
						<a href="<c:url value='/BookServlet?method=findById&bookId=A92FCEC8F7604CECBDE33868FF690CB7'/>">
						<img
							src="${pageContext.request.contextPath }/bookimages/yu.jpg "></a>
					</div>
				</div>

			</div>
			<div class="clear "></div>
		</div>
	</div>
	<!-- 底部 -->
	<jsp:include page="footer.jsp"></jsp:include> 

</body>

</html>
