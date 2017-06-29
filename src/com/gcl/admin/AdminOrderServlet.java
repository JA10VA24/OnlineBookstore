package com.gcl.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcl.bean.Order;
import com.gcl.service.OrderService;
import com.gcl.servlet.MyServlet;

public class AdminOrderServlet extends MyServlet {
	
	private OrderService service = new OrderService();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	}
	
	/**
	 * 查找所有订单
	 */
	public String findAllOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		List<Order> orderList = service.findAllOrder();
		request.setAttribute("orderList", orderList);
		return "forward:/pages/after/orderQuery.jsp";
	}
	
	/**
	 * 按订单状态查找订单
	 */
	public String findByOrderState(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		int orderState = Integer.parseInt(request.getParameter("orderState"));
		List<Order> orderList = service.findByOrderState(orderState);
		request.setAttribute("orderList", orderList);
		return "forward:/pages/after/orderQuery.jsp";
	}
	
	/**
	 * 订单发货
	 */
	public String send(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		String orderId = request.getParameter("orderId");
		service.updateOrderState(3, orderId);
		request.setAttribute("msg", "发货成功！");
		return "forward:/pages/after/tip.jsp";
	}

}
