<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="${pageContext.request.contextPath }/css/optstyle.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" />

	<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/quick_links.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.imagezoom.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/list.js"></script>
	<style type="text/css">
		#shouye{font-weight: 400;color: white;font-size: 16px;}
		#skip{margin-top: 50px;}
	</style>


  </head>

<body>
	<jsp:include page="/top.jsp"></jsp:include>
	<div class="clear"></div>
	<b class="line"></b>
		<!--分类-->
		<div class="nav-table">
			<div class="long-title">
				<a href="${pageContext.request.contextPath }/index.jsp"><span
					id="shouye">首页</span></a>
			</div>
			<div class="nav-cont">
				<ul>
					<c:forEach items="${category }" var="c">
						<li class="qc"><a
							href="<c:url value='/BookServlet?method=findByCategory&categoryName=${c.categoryName }&categoryId=${c.categoryId }'/>">${c.categoryName }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="#">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">内容</li>
		</ol>
		<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">


					<div class="tb-booth tb-pic tb-s310">
						<a href=""><img src="${book.bookImg }" class="jqzoom" /></a>
					</div>
				</div>
				<div id="skip"></div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${book.bookName }</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<ul>
							<li class="price iteminfo_price">
								<dl>
									<dt>销售价</dt>
									<dd>
										<em>¥</em><b class="sys_item_price">${book.bookPrice }</b>
									</dd>
								</dl>
							</li>
						</ul>
						<div class="clear"></div>
					</div>


					<div class="clear"></div>
						<div class="theme-popover">
							<div class="theme-popbod dform">
								<div class="theme-signin-left">
									<div class="theme-options">
										<div class="cart-title">书名</div>
											<ul>
												<li class="sku-line selected">${book.bookName }<i></i></li>
											</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title">作者</div>
												<ul>
													<li class="sku-line selected">${book.bookAuthor }<i></i></li>
												</ul>
											</div>
										<form id="form" class="theme-signin" action="<c:url value='/CartServlet'/>" method="post">
											<input type="hidden" name="method" value="add"/>
  											<input type="hidden" name="bookId" value="${book.bookId }"/>
											<div class="theme-options">
												<div class="cart-title number">数量</div>
													<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" /> 
													<input id="text_box" name="bookCount"type="text" value="1" style="width:30px;" />
													<input id="add" class="am-btn am-btn-default" name=""type="button" value="+" />
											</div>
										</form>
									</div>
								</div>
							</div>
					<div class="clear"></div>
				</div>
				<div class="pay">
					<ul><li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket" title="加入购物车" href="javascript:document.getElementById('form').submit();"><i></i>加入购物车</a>
						</div>
					</li></ul>
				</div>

			</div>

			<div class="clear"></div>

		</div>


		<div class="clear"></div>
		<div class="am-tabs" data-am-tabs>
			<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
			</ul>
		</div>
		<div class="clear"></div>
		<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include> 
</body>
</html>
