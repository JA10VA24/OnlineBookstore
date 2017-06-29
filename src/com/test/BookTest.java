package com.test;

import java.util.List;

import org.junit.Test;

import com.gcl.bean.Book;
import com.gcl.dao.BookDao;

public class BookTest {
	BookDao dao = new BookDao();
	@Test
	public void bookTest() {
		List<Book> list = dao.findByCategory("c002");
		System.out.println(list);
	}
	
}
