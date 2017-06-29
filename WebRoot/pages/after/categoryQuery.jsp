<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'categoryQuery.jsp' starting page</title>
    
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
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 分类列表</strong></div>
  <table class="table table-hover text-center">
    <tr>
      <th width="10%">分类编号</th>     
      <th>分类名称</th>  
      <th>分类描述</th>     
      <th width="250">操作</th>
    </tr>
   <c:forEach items="${categoryList }" var="c">
	    <tr>
	      <td>${c.categoryId }</td>      
	      <td>${c.categoryName }</td>  
	      <td>${c.categoryDesc }</td>      
	      <td>
	      <div class="button-group">
	      <a class="button border-main" href="<c:url value='/AdminCategoryServlet?method=updatePre&categoryName=${c.categoryName }'/>"><span class="icon-edit"></span>修改</a>
	       <a class="button border-red" href="<c:url value='/AdminCategoryServlet?method=delete&categoryId=${c.categoryId }'/>" onclick="return del(17)"><span class="icon-trash-o"></span> 删除</a>
	      </div>
	      </td>
	    </tr> 
    </c:forEach>
  </table>
</div>
<script>
function del(id){
	if(confirm("您确定要删除吗?")){
		
	}
}
</script>

  </body>
</html>
