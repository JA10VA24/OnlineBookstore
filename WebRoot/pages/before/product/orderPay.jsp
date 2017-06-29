<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/css/orderpay.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath }/css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/address.js"></script>

	<style type="text/css">
		#shouye{font-weight: 400;color: white;font-size: 16px;}
		#clear a{text-decoration: none;color:red}
		#clear a:hover{color:blue;}
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

	<div class="clear"></div>
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="clear"></div>
			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>&nbsp;</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">小计</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">付款状态</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
				<c:forEach items="${order.itemList }" var="item">
					<tr class="item-list">
						<div class="bundle  bundle-last">

							<div class="bundle-main">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" class="J_MakePoint"> <img
													src="${item.book.bookImg }" width="50px" height="70px"
													class="itempic J_ItemImg"></a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="#" class="item-title J_MakePoint"
														data-point="tbcart.8.11">${item.book.bookName }</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props">
												<span class="sku-line">作者：${item.book.bookAuthor }</span> <br />
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<em class="J_Price price-now">￥${item.book.bookPrice }</em>
												</div>
											</div>
										</li>
									</div>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<span class="phone-title">购买数量</span>
												<div class="sl">
													<span>${item.count }</span>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">￥${item.subtotal }</em>
										</div>
									</li>
									<li class="td td-oplist">
										<div class="td-inner">

											<div class="pay-logis">未付款</div>
										</div>
									</li>

								</ul>
								<div class="clear"></div>
							</div>
						</div>
					</tr>
					</c:forEach>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="pay-total">

				<div class="clear"></div>
			</div>

			<div class="clear"></div>
			<!--支付方式-->
			<div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card"><img
						src="<c:url value='/images/wangyin.jpg'/>" />银联<span></span></li>
					<li class="pay qq"><img
						src="<c:url value='/images/weizhifu.jpg'/>" />微信<span></span></li>
					<li class="pay taobao"><img
						src="<c:url value='/images/zhifubao.jpg'/>" />支付宝<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="pay-total">

				<div class="clear"></div>
			</div>
			<!--收货地址-->
			<form id="form" action="<c:url value='/OrderServlet'/>" method="post">
			<input type="hidden" name="method" value="pay"/>
			<input type="hidden" name="orderId" value="${order.orderId }"/>
			<div class="order-extra">
				<div class="order-user-info">
					<div id="holyshit257" class="memo">
						<label>收货地址：</label> <input type="text"
							class="memo-input J_MakePoint c2c-text-default memo-close"
							value="安徽省安庆市宜秀区安庆师范大学龙山校区卓越（1）班" />
						<div class="msg hidden J-msg">
							<p class="error">最多输入500个字符</p>
						</div>
					</div>
				</div>
			</div>
			</form>
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee">${order.orderTotal }</em>
							</span>
						</div>

						<div id="holyshit268" class="pay-address"></div>
					</div>
					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
							<a id="J_Go" href="javascript:document.getElementById('form').submit();" class="btn-go" tabindex="0"
								title="点击此按钮，提交订单">直接结算</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include> 
  </body>
</html>
