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

<title>分类下的所有商品</title>
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
<link href="${pageContext.request.contextPath }/css/seastyle.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/skin.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<style type="text/css">
	#shouye{font-weight: 400;color: white;font-size: 16px;}
</style>
</head>

<body>

	<jsp:include page="/top.jsp"></jsp:include>
	<div class="clear"></div>
	<!-- 分类列表 -->
		<b class="line"></b>
        <div class="search">
			<div class="search-list">
				<div class="nav-table">
					<div class="long-title"><a href="${pageContext.request.contextPath }/index.jsp"><span id="shouye">首页</span></a></div>
					<div class="nav-cont">
						<ul>
						<c:forEach items="${category }" var="c">
							<li class="qc"><a href="<c:url value='/BookServlet?method=findByCategory&categoryName=${c.categoryName }&categoryId=${c.categoryId }'/>">${c.categoryName }</a></li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
				
		<div class="am-g am-g-fixed">
			<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">														
							<div class="searchAbout">
								<span class="font-pale">当前分类：${categoryName }</span>
								<a  href="#"></a>
							</div>
							<div class="clear"></div>
                        </div>
							<div class="search-content">
								<div class="sort">
									<li class="first"><a title="综合">品质之选</a></li>
									<li><a title="销量">保障正品</a></li>
									<li><a title="价格"></a></li>
									<li class="big"></li>
								</div>
								<div class="clear"></div>

							<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
								<c:forEach items="${bookList }" var="b">
									<li>
										<a href="${pageContext.request.contextPath }/BookServlet?method=findById&bookId=${b.bookId}">
										<div class="i-pic limit">
												<img src="${pageContext.request.contextPath }/${b.bookImg}" />											
												<p class="title fl">${b.bookName }</p>
												<p class="price fl">
												<b>¥</b>
												<strong>${b.bookPrice }</strong>
											</p>
										</div>
										</a>
									</li>
									
							</c:forEach>
							</ul>
							</div>
							<div class="clear"></div>
						</div>
			</div>
		<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include> 
  </body>
</html>
