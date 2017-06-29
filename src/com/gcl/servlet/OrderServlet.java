package com.gcl.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Cart;
import com.gcl.bean.CartItem;
import com.gcl.bean.Order;
import com.gcl.bean.OrderItem;
import com.gcl.bean.User;
import com.gcl.service.OrderService;

public class OrderServlet extends MyServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private OrderService service = new OrderService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	}
	
	//添加订单
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		/**
		 * 添加订单实际上是把购物车里的东西一下子全部加进订单里
		 * 1.得到购物车
		 * 2.添加相应的项
		 */
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		Order order = new Order();
		//设置相应的参数
		order.setOrderId(CommonUtils.uuid());
		order.setOrderTime(new Date());
		order.setOrderTotal(cart.getTotal());			//购物车里有所有图书的总价
		order.setOrderState(1); 						//1.表示未付款
		User user = (User)request.getSession().getAttribute("user");
		order.setUser(user);
		
		List<OrderItem> orderItemList = new ArrayList<>();
		//对于orderItemList可以遍历cartItem
		for (CartItem item : cart.getCartItems()) {
			OrderItem orderItem = new OrderItem();
			
			orderItem.setItemId(CommonUtils.uuid());
			orderItem.setCount(item.getBookCount());
			orderItem.setSubtotal(item.getBookSum());
			orderItem.setBook(item.getBook());
			orderItem.setOrder(order);
			orderItemList.add(orderItem);
		}
		order.setItemList(orderItemList);
		service.addOrder(order);
		request.setAttribute("order", order);
		//清空购物车
		cart.clearCart();
		return "forward:/pages/before/product/orderPay.jsp";
	}
	
	/**
	 * 查看我的订单
	 */
	public String myOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取当前用户
		User user = (User)request.getSession().getAttribute("user");
		List<Order> orderList = service.findOrderByUserId(user.getUserId());
		//将订单保存
		request.setAttribute("orderList", orderList);
		return "forward:/pages/before/product/orderList.jsp";
	}
	
	/**
	 * 按状态查询订单
	 */
	public String findByState(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		int orderState = Integer.parseInt(request.getParameter("orderState"));
		System.out.println("d:" + orderState);
		List<Order> orderList = service.findByOrderState(orderState);
		
		//将订单保存
		request.setAttribute("orderList", orderList);
		return "forward:/pages/before/product/orderList.jsp";
	}
	
	/**
	 * 用户付款:改变订单状态
	 */
	public String pay(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		String orderId = request.getParameter("orderId");
		Order order = service.findOrderByOrderId(orderId);
		//修改订单状态
		service.updateOrderState(2, orderId);
		//将订单保存
		request.setAttribute("order", order);
		return "forward:/pages/before/product/paysuccess.jsp";
	}
	
	/**
	 * 确认收获
	 */
	public String confirm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		String orderId = request.getParameter("orderId");
		service.updateOrderState(4, orderId);
		return "forward:/pages/before/product/confirmsuccess.jsp";
	}
}
