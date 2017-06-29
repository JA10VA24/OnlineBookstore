package com.gcl.service;

import java.util.List;

import com.gcl.bean.Book;
import com.gcl.dao.BookDao;

public class BookService {
	
	BookDao dao = new BookDao();
	
	//通过分类查找图书
	public List<Book> findByCategory(String categoryId) {
		return dao.findByCategory(categoryId);
	}
	
	//通过Id查找图书
	public Book findById(String bookId) {
		return dao.findById(bookId);
	}
	
	/**
	 * 添加图书
	 * @param book
	 */
	public void addBook(Book book) {
		dao.add(book);
	}
	
	/**
	 * 查询所有图书
	 * @return
	 */
	public List<Book> findAllBook() {
		
		return dao.findAll();
	}
	
	/**
	 * 修改图书信息
	 * @param book
	 */
	public void updateBook(Book book) {
		
		 dao.updateBook(book);
	}
	
	/**
	 * 通过id删除图书
	 * @param bookId
	 */
	public void deleteByBookId(String bookId) {
		// TODO Auto-generated method stub
		dao.deleteById(bookId);
	}
	
	/**
	 * 通过关键字搜索
	 * @param bookName
	 * @return
	 */
	public List<Book> findByKeyword(String bookName) {
		
		return dao.findByKeyword(bookName);
	}
}
