<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'msg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		img {
			margin-left: 590px;
			margin-top: 30px;
		}
		h3 {
			color: red;
			font-size: 25px;
			margin-left: 520px;
		}
		input {
			width: 100px;
			height: 30px;
			color: white;
			background-color: #46a3ff;
			margin-left: 570px;
		}
		#content {
			margin-top: 150px;
			margin-left: 0px;
		}
	</style>
  </head>
  
  <body>
  	<div id="content">
    	<img  src="images/success.png">
   		<h3>恭喜，注册成功！</h3>
   		<a href="pages/before/user/login.jsp"><input type="button" value="立即登录"></a>
    </div>
  </body>
</html>
