package com.gcl.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Book;
import com.gcl.bean.Order;
import com.gcl.bean.OrderItem;
import com.gcl.utils.JdbcUtils;

public class OrderDao {
	
	private QueryRunner qr = new QueryRunner(JdbcUtils.getDateSource());
	
	/*
	 * 添加订单：添加订单要添加条目（一个订单有好多条目）不像购物车，购物车每次只添加一个所以比较简单
	 * 		      订单的添加是添加好多东西
	 */
	public void addOrder(Order order) {
		String sql = "insert into orders values(?,?,?,?,?,?)";
		/*
		 * 设置参数：这里有个时间问题的转换，要把utilDate转换成sqlDate
		 */
		Timestamp time = new Timestamp(order.getOrderTime().getTime());
		//设置参数
		Object[] params = {order.getOrderId(), time, order.getOrderTotal(), order.getOrderState(),
				order.getUser().getUserId(), order.getAddress()}; 
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加订单的时候需要同时添加订单的内容
	 * 订单的内容有许多不止一个，需要用到批处理
	 */
	public void addOrderItems(List<OrderItem> orderItemList) {
		//要添加好多 ，用二维数组，前面的保存个数和下标，后面的保存内容
		String sql = "insert into orderItem values(?,?,?,?,?) ";
		Object[][] params = new Object[orderItemList.size()][];
		for (int i = 0; i < orderItemList.size(); i++) {
			//得到具体的内容
			OrderItem item = orderItemList.get(i);
			//给每一个记录填充内容
			params[i] = new Object[]{item.getItemId(),item.getCount(), item.getSubtotal(), item.getOrder().getOrderId(), 
					item.getBook().getBookId()};
		}
		try {
			qr.batch(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//通过id获取订单信息
	public Order findById(String orderId) {
		
		String sql = "select * from orders where orderId=?";
		Order order = null;
		Object[] params = {orderId};
		try {
			order = qr.query(sql, new BeanHandler<>(Order.class), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}
	
	//修改订单的状态
	public void updateState(int state, String orderId) {
		
		String sql = "update orders set orderState=? where orderId=?";
		Object[] params = {state,orderId};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过用户Id查找订单
	 * @return
	 */
	public List<Order> findByUserId(String userId) {
		List<Order> orderList = null;
		String sql = "select * from orders where userId=?";
		Object[] params = {userId};
		try {
			orderList = qr.query(sql, new BeanListHandler<>(Order.class), params);
			//遍历每一个order为其添加订单条目
			for (Order order : orderList) {
				loadOrderItems(order);			//给订单加载条目
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	/**
	 * 通过订单的状态查找订单
	 * @return
	 */
	public List<Order> findByState(int orderState) {
		List<Order> orderList = null;
		String sql = "select * from orders where orderState=?";
		Object[] params = {orderState};
		try {
			orderList = qr.query(sql, new BeanListHandler<>(Order.class), params);
			//遍历每一个order为其添加订单条目
			for (Order order : orderList) {
				loadOrderItems(order);			//给订单加载条目
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	/**
	 * 查找所有订单
	 * @return
	 */
	public List<Order> finAll() {
		List<Order> orderList = null;
		String sql = "select * from orders";
		try {
			orderList = qr.query(sql, new BeanListHandler<>(Order.class));
			//遍历每一个order为其添加订单条目
			for (Order order : orderList) {
				loadOrderItems(order);			//给订单加载条目
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}
	//加载订单条目
	private void loadOrderItems(Order order) {
		
		String sql = "select * from orderitem o, t_book b where o.bookId=b.bookId and orderId=?";
		try {
			//封装信息
			List<Map<String, Object>> mapList = qr.query(sql,new MapListHandler(), order.getOrderId());
			List<OrderItem> orderItemList = toOrderItemList(mapList);
			order.setItemList(orderItemList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//加载订单条目列表
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		
		List<OrderItem> orderItemList = new ArrayList<>();
		for (Map<String, Object> map : mapList) {
			OrderItem item = toOrderItem(map);
			orderItemList.add(item);
		}
		return orderItemList;
	}
	
	//加载订单条目
	private OrderItem toOrderItem(Map<String, Object> map) {
		OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
		Book book = CommonUtils.toBean(map, Book.class);
		orderItem.setBook(book);
		return orderItem;
	}
}
