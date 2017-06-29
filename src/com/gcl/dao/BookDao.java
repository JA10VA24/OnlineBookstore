package com.gcl.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Book;
import com.gcl.bean.Category;
import com.gcl.utils.JdbcUtils;


public class BookDao {
	
	QueryRunner qr = new QueryRunner(JdbcUtils.getDateSource());
	/**
	 * 查询所有图书
	 */
	public List<Book> findAllBook() {
		List<Book> list = null;
		String sql = "select * from t_book where del=false";
		try {
			list = qr.query(sql, new BeanListHandler<>(Book.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 按分类查询
	 */
	public List<Book> findByCategory(String categoryId) {
		List<Book> list = null;
		String sql = "select * from t_book where categoryId=? and del=false";
		Object[] params = {categoryId};
		try {
			list = qr.query(sql, new BeanListHandler<>(Book.class), params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	//通过id查找图书
	public Book findById(String bookId) {
		Book book = null;
		String sql = "select * from t_book where bookId=? and del=false";
		Object[] params = {bookId};
		try {
			Map<String, Object> map = qr.query(sql, new MapHandler(), params);
			book = CommonUtils.toBean(map, Book.class);
			Category category = CommonUtils.toBean(map, Category.class);
			book.setCategory(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
	
	/**
	 * 添加图书
	 * @param book
	 */
	public void add(Book book) {
		
		String sql = "insert into t_book values(?,?,?,?,?,?,?)";
		Object[] params = {book.getBookId(), book.getBookName(), book.getBookPrice(), book.getBookAuthor(),
				book.getBookImg(), book.getCategory().getCategoryId(), book.isDel()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查找所有图书，带分类信息的
	 * @return
	 */
	public List<Book> findAll() {
		List<Book> list = new ArrayList<>();
		String sql = "select * from t_book where del=false";
		try {
			List<Map<String, Object>> mapList = qr.query(sql,new MapListHandler());
			for (Map<String, Object> map : mapList) {
				//是每一个map
				Book book = CommonUtils.toBean(map, Book.class);
				Category category = CommonUtils.toBean(map, Category.class);
				book.setCategory(category);
				list.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 修改图书
	 * @param book
	 * @return
	 */
	public void updateBook(Book book) {
		
		String sql = "update t_book set bookName=?, bookPrice=?, bookAuthor=?, bookImg=?, categoryId=? where bookId=?";
		System.out.println(book.toString());
		Object[] params = {book.getBookName(), book.getBookPrice(), book.getBookAuthor(),
				book.getBookImg(),book.getCategory().getCategoryId(), book.getBookId()};
		System.out.println(params.toString());
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过id删除图书
	 * 实际上是假删除，改变图书的状态
	 * @param bookId
	 */
	public void deleteById(String bookId) {
		
		String sql = "update t_book set del=true where bookId=?";
		try {
			qr.update(sql, bookId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过关键字搜索
	 * @param bookName
	 * @return
	 */
	public List<Book> findByKeyword(String bookName) {
		
		List<Book> bookList = null;
		String sql = "select * from t_book where bookName like ? and del=false";
		try {
			bookList = qr.query(sql, new BeanListHandler<>(Book.class), "%" + bookName + "%");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookList;
	}
}
