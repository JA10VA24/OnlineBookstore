<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'footer.jsp' starting page</title>
    
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
					- Design By <a href="${pageContext.request.contextPath }/pages/after/login.jsp" title="author"
					target="_blank">郭存磊</a></em>
			</p>
		</div>
	</div>
  </body>
</html>
