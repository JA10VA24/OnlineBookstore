package com.gcl.bean;

import java.math.BigDecimal;

/**
 * 购物车里的条目
 */
public class CartItem {
	
	private Book book;						//要有书
	private int bookCount;					//书的数量
	private double bookSum;					//此类书的总价钱
	
	//图书的总价格可以计算得出
	public double getBookSum() {
		/**
		 * double是有误差的，对于金额类的，尽量不要有误差
		 */
		BigDecimal bookPrice = new BigDecimal(book.getBookPrice() + "");	//图书的单价
		BigDecimal bCount = new BigDecimal(bookCount + "");					//图书的数量
		return bookPrice.multiply(bCount).doubleValue();
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

}
