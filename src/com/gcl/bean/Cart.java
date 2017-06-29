package com.gcl.bean;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;



/**
 *购物车的类 
 *
 */
public class Cart {
	
	Map<String, CartItem> cartMap = new HashMap<>();		//完整的购物车包括车的id和条目
	
	//添加条目到购物车
	public void addCartItem(CartItem cartItem) {
		
		//判断车里面是否已经存在此类图书
		String bookId = cartItem.getBook().getBookId();
		if(cartMap.containsKey(bookId)) {
			//如果存在，就获取车里面的内容
			CartItem date_item = cartMap.get(bookId);
			//重新设置书的数量
			date_item.setBookCount(date_item.getBookCount() + cartItem.getBookCount());
			//再保存进map,重新设置过数量的Item
			cartMap.put(bookId, date_item);
		}else {
			cartMap.put(cartItem.getBook().getBookId(), cartItem);
		}
	}
	
	//得到购物车里的所有图书的总价格
	public double getTotal() {
		
		BigDecimal total = new BigDecimal("0");			//初始化为0
		//遍历此购物车的所有条目
		for (CartItem item : cartMap.values()) {
			//得到每一种图书的总价格
			BigDecimal bookSum = new BigDecimal(item.getBookSum() + "");
			total = total.add(bookSum);
		}
		return total.doubleValue();
	}
	/**
	 * 清空购物车
	 */
	public void clearCart() {
		cartMap.clear();
	}
	
	/**
	 * 删除指定的商品
	 * @param bid
	 */
	public void deleteById(String bid) {
		cartMap.remove(bid);
	}
	
	/**
	 * 查看购物车里的所有商品
	 * @return
	 */
	public Collection<CartItem> getCartItems() {
		return cartMap.values();
	}
}
