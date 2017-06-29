<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单查询页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>  
	<style type="text/css">
		#tip {margin-left: 5px;text-align: left;}
	</style>
  </head>
  
  <body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 订单列表</strong> </div>
    <table class="table table-hover text-center">
    	<c:forEach items="${orderList }" var="order">
    	<tr bgcolor="#bebebe" height="30px;">
			<td colspan="8" id="tip">
				订单编号：${order.orderId }　    成交时间：<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss" />　
				金额：<font color="red"><b>${order.orderTotal }元</b></font> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:choose>
					<c:when test="${order.orderState eq 1 }">未付款</c:when>
					<c:when test="${order.orderState eq 2 }"><a href="<c:url value='AdminOrderServlet?method=send&orderId=${order.orderId }'/>"><font color="red">等待发货</font></a></c:when>
					<c:when test="${order.orderState eq 3 }">已发货</c:when>
					<c:when test="${order.orderState eq 4 }">交易完成</c:when>
				</c:choose>
			</td>
	   </tr>
       <c:forEach items="${order.itemList }" var="item">
        <tr>
          <td width="10%"><img src="<c:url value='/${item.book.bookImg }'/>"  width="50" height="65" /></td>
          <td style="text-align:left; padding-left:0px;"></td>
          <td>图书名称：${item.book.bookName }</td>
          <td><font color="red">价格：￥${item.book.bookPrice }</font></td>
          <td>作者：${item.book.bookAuthor }</td>
          <td>数量：${item.count }</td>
          
          <td>小计：${item.subtotal }</td>
        </tr>
       		</c:forEach> 
       </c:forEach>
    </table>
  </div>
</form>

  </body>
</html>
