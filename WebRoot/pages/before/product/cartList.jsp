<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购物车页面</title>
    
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
	<link href="${pageContext.request.contextPath }/css/cartstyle.css" rel="stylesheet" type="text/css" />

	<link href="${pageContext.request.contextPath }/css/optstyle.css" rel="stylesheet" type="text/css" />


	<script type="text/javascript" src="${pageContext.request.contextPath }/js/address.js"></script>

	<style type="text/css">
		#shouye{font-weight: 400;color: white;font-size: 16px;}
		#clear a{text-decoration: none;color:red}
		#clear a:hover{color:blue;}
	</style>
  </head>
  
  <body>
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
	<!-- 分类列表结束 -->
	
		<!--购物车 -->
			<div class="concent">
				<div id="cartTable">
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
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					
					<table border="2" class="item-list">
					<tr>
						<div class="bundle  bundle-last ">
							<div class="bundle-hd">
								<div class="bd-promos">
									<div class="act-promo" id="clear">
										<a href="${pageContext.request.contextPath }/CartServlet?method=clear">清空购物车<span class="gt">&gt;&gt;</span></a>
									</div>
								</div>
							</div>
							<div class="clear"></div>
						<c:forEach items="${cart.cartItems }" var="item">
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank"  class="J_MakePoint" data-point="tbcart.8.12">
												<img src="<c:url value='/${item.book.bookImg }'/>" height="75"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="${pageContext.request.contextPath }/BookServlet?method=findById&bookId=${item.book.bookId}" target="_blank"  data-point="tbcart.8.11">${item.book.bookName }</a>
											</div>
										</div>
									</li>
								
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="J_Price price-now" >￥${item.book.bookPrice }</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													${item.bookCount }
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">￥${item.bookSum }</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner" id="clear">
											<a href="${pageContext.request.contextPath }/CartServlet?method=deleteById&bookId=${item.book.bookId}"  class="delete">删除</a>
										</div>
									</li>
								</ul>
							</div>
						</c:forEach>
						</div>
					</tr>
					</table>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					
					<div class="float-bar-right">
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">${cart.total }</em></strong>
						</div>
						<div class="btn-area">
							<a href="<c:url value='/OrderServlet?method=add'/>" id="J_Go" class="submit-btn submit-btn-disabled" >
								<span>结&nbsp;算</span></a>
						</div>
					</div>
				</div>
		
			</div>
		<!-- 底部 -->
	<jsp:include page="/footer.jsp"></jsp:include> 
  </body>
</html>
