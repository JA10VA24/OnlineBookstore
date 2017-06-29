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
  </head>
  
  <body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>修改图书</strong>
		</div>
		<div class="body-content">
			<form  class="form-x" action="<c:url value='/AdminBookServlet'/>" method="post" >
				<input type="hidden" name="method" value="update"/>
				<input type="hidden" name="bookImg" value="${book.bookImg }">
				<input type="hidden" name="bookId" value="${book.bookId }"/>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<img src="<c:url value='/${book.bookImg }'/>" width="60px" height="80px"/> 
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图书名称：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${book.bookName }" name="bookName"
							data-validate="required:请输入图书名称" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>分类标题：</label>
					</div>
					<div class="field">
						<select name="categoryId" class="input w50">
            				<c:forEach items="${categoryList }" var="c">
            					<option value='${c.categoryId }' <c:if test="${c.categoryId eq book.category.categoryId }">selected="selected"</c:if>> 
            					&nbsp;${c.categoryName }</option>
            				</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="bookPrice" value="${book.bookPrice }" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>作者：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="bookAuthor" value="${book.bookAuthor }" />
						<div class="tips"></div>
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
