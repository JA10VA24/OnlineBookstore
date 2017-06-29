<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'tip.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
	<style type="text/css">
		*{ margin:0px; padding:0px;}
		.error-container{ background:#fff; border:1px solid #0ae;  text-align:center; width:100%;height: 100%; margin:0px auto; font-family:Microsoft Yahei; padding-bottom:30px; border-top-left-radius:5px; border-top-right-radius:5px;  }
		.error-container h1{ font-size:16px; padding:12px 0; background:#0ae; color:#fff;} 
		.errorcon{ padding:35px 0; text-align:center; color:#0ae; font-size:18px;}
		.errorcon i{ display:block; margin:12px auto; font-size:30px; }
		.errorcon span{color:red;}
		h4{ font-size:14px; color:#666;}
		a{color:#0ae;}
	</style>
  </head>
  
  <body>
<body class="no-skin">
<div class="error-container"> 
    <h1> 网上书城后台管理系统 </h1>   
    <div class="errorcon">     
        <i class="icon-smile-o"></i>${msg }        
   </div>
</div>

<script type="text/javascript">
	(function(){
	var wait = document.getElementById('wait'),href = document.getElementById('href').href;
	var interval = setInterval(function(){
		var time = --wait.innerHTML;
		if(time <= 0) {
			location.href = href;
			clearInterval(interval);
		};
	}, 1000);
	})();
</script>

  </body>
</html>
