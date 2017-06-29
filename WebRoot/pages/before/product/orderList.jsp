<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<style type="text/css">
		#shouye{font-weight: 400;color: white;font-size: 16px;}
		#clear a{text-decoration: none;color:red}
		#clear a:hover{color:blue;}
		#time {margin-left: 80px;}
		#time1 {margin-left: 170px;}
		#time2 {margin-left: 170px;color: red}
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
	<b class="line"></b>
<!-- 分类列表结束 -->

	<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="user-order">
						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
						

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">&nbsp;&nbsp;</td>
										</div>
										<div class="th th-operation">
											<span class="td-inner">数量</span>
										</div> 
										<div class="th th-amount">
											<td class="td-inner">小计</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<!--交易成功-->
										<c:forEach items="${orderList }" var="order">
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：${order.orderId }</div>
													<span id="time">成交时间：<fmt:formatDate value="${order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
													<span id="time">总金额：<font color="red"><b>${order.orderTotal }元</b></font></span> 
													<c:choose>
														<c:when test="${order.orderState eq 1 }">
															<a id="aInfo" href="<c:url value='OrderServlet?method=pay&orderId=${order.orderId }'/>"><span id="time2">一键支付</span></a>
														</c:when>
														<c:when test="${order.orderState eq 2 }"><span id="time1">等待发货</span></c:when>
														<c:when test="${order.orderState eq 3 }">
															<a id="aInfo" href="<c:url value='OrderServlet?method=confirm&orderId=${order.orderId }'/>"><span id="time2">确认收货</span></a>
														</c:when>
														<c:when test="${order.orderState eq 4 }"><span id="time1">交易完成</span></c:when>
													</c:choose>
												</div>
												<c:forEach items="${order.itemList }" var="item">
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="<c:url value='/${item.book.bookImg }'/>" class="itempic J_ItemImg" width="50px" height="70px">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<span>${item.book.bookName }</span><br/>
																			<span class="info-little">${item.book.bookAuthor } </span>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	￥${item.book.bookPrice }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span></span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<div class="item-number">
																		<span>×</span>${item.count }
																	</div>
																</div>
															</li> 
														<li class="td td-amount">
															<div class="item-amount">
																￥${item.subtotal }
															</div>
														</li>
											
														</ul>
													</div>
												</div>
												</c:forEach>
											</div>
										</c:forEach> 
									</div>
									</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include> 
  </body>
</html>
