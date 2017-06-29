<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>付款成功页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"/>
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
	
	<link href="${pageContext.request.contextPath }/css/sustyle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery-1.7.min.js"></script>
	<style type="text/css">
		#shouye{font-weight: 400;color: white;font-size: 16px;}
		#success{margin-top: 10px;}
	</style>
  </head>
  
  <body>
 	<!--  头部 -->
	<jsp:include page="/top.jsp"></jsp:include>
	<div class="clear"></div>
	<!-- 分类列表 -->
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
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
		</div>
	</div>
	<b class="line"></b>
	<!-- 分类列表结束 -->
	<div class="take-delivery">
 	<div class="status">
   	<h2 id="success">收获成功！</h2>
  	<div class="successInfo">
     <div class="option">
       <span class="info">您可以</span>
       	<c:choose>
       		<c:when test="${empty user }">
       			<a href="<c:url value='/pages/before/user/login.jsp'/>" class="">查看<span>已买到的宝贝</span></a>
       		</c:when>
       		<c:otherwise>
       			<a href="<c:url value='/OrderServlet?method=myOrder'/>" class="">查看<span>已买到的宝贝</span></a>
       		</c:otherwise>
        	
        </c:choose>
     </div>
    </div>
  </div>
</div>
	
	<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include> 
  </body>
</html>
