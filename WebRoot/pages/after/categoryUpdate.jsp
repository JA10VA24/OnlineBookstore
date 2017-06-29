<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'addbook.jsp' starting page</title>
    
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
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script> 
    <style type="text/css">
    	#msg {color: red;}
    </style> 
  </head>
  
  <body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>添加分类</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="<c:url value='/AdminCategoryServlet'/>">
				<input type="hidden" name="method" value="update"/>
				<input type="hidden" name="categoryId" value="${category.categoryId }"/>
				<div class="form-group">
					<div class="label">
						<label>分类名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="categoryName" value="${category.categoryName }"
							data-validate="required:请输入分类名称" />
						<div class="tips"></div>
					</div>
				</div>
     			<div class="form-group">
       			 	<div class="label">
         				<label>分类描述：</label>
       				 </div>
       				<div class="field">
        		 		<textarea  class="input" name="categoryDesc" style="height:100px;" data-validate="required:请输入分类描述">${category.categoryDesc }</textarea>
        		 		<div class="tips"></div>        
        			</div>
     			</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<span id="msg">${msg }</span>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
