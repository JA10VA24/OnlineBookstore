package com.gcl.service;

import java.sql.SQLException;
import java.util.List;

import com.gcl.bean.Order;
import com.gcl.dao.OrderDao;
import com.gcl.utils.JdbcUtils;

public class OrderService {
	
	private OrderDao dao = new OrderDao();
	
	/*
	 * 添加订单：要使用事务，保证添加订单和添加订单条目是一起的
	 */
	public void addOrder(Order order) {
		try {
			//开启事务
			JdbcUtils.startTransaction();
			dao.addOrder(order);
			dao.addOrderItems(order.getItemList());
			
			//提交事务
			JdbcUtils.commitTransaction();
			
		} catch (Exception e) {
			try {
				//回滚事务
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	
	/**
	 * 通过用户id查找订单
	 * @param userId
	 * @return
	 */
	public List<Order> findOrderByUserId(String userId) {
		return dao.findByUserId(userId);
	}
	/**
	 * 通过订单id查找订单
	 * @param orderId
	 * @return
	 */
	public Order findOrderByOrderId(String orderId) {
		return dao.findById(orderId);
	}
	
	/**
	 * 通过订单状态查找订单
	 * @param userId
	 * @return
	 */
	public List<Order> findByOrderState(int orderState) {
		return dao.findByState(orderState);
	}
	
	/**
	 * 修改订单状态
	 * @param userId
	 * @return
	 */
	public void updateOrderState(int orderState, String orderId) {
		dao.updateState(orderState, orderId);
	}
	
	/**
	 * 查找所有订单
	 * @return
	 */
	public List<Order> findAllOrder() {
		
		return dao.finAll();
	}
}
