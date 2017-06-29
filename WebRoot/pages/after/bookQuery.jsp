<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>  

  </head>
  
  <body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 图书 列表</strong> </div>
    <table class="table table-hover text-center">
      <tr>
        <th>图片</th>
        <th width="100" style="text-align:left; padding-left:0px;"></th>
        <th width="15%">名称</th>
        <th>价格</th>
        <th>作者</th>
        <th width="10%">分类名称</th>
        <th width="1%"></th>
        <th width="310">操作</th>
      </tr>
       <c:forEach items="${bookList }" var="book">
        <tr>
          <td width="10%"><img src="<c:url value='/${book.bookImg }'/>"  width="50" height="65" /></td>
          <td style="text-align:left; padding-left:0px;"></td>
          <td>${book.bookName }</td>
          <td><font color="red">￥${book.bookPrice }</font></td>
          <td>${book.bookAuthor }</td>
          <c:forEach items="${categoryList }" var="c">
          	<c:if test="${c.categoryId eq book.category.categoryId }">
         	<td>${c.categoryName }</td>
          </c:if>
          </c:forEach>
          <td></td>
          <td>
          	<div class="button-group"> 
          		<a class="button border-main" href="<c:url value='/AdminBookServlet?method=updatePre&bookId=${book.bookId }'/>"><span class="icon-edit"></span> 修改</a> 
          		<a class="button border-red" href="<c:url value='/AdminBookServlet?method=delete&bookId=${book.bookId }'/>" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> 
          	</div>
          </td>
        </tr>
       </c:forEach> 
    </table>
  </div>
</form>

  </body>
</html>
