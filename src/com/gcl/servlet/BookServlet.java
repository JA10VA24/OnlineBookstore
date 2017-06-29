package com.gcl.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcl.bean.Book;
import com.gcl.service.BookService;

public class BookServlet extends MyServlet {
	
	private static final long serialVersionUID = 1L;
	private BookService service = new BookService();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	}
	
	//通过分类查找此类别下的所有图书
	public String findByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取参数
		String categoryId = request.getParameter("categoryId");
		String categoryName = request.getParameter("categoryName");
		List<Book> bookList = service.findByCategory(categoryId);
		request.setAttribute("bookList", bookList);
		request.setAttribute("categoryName", categoryName);
		return "forward:/pages/before/product/productList.jsp";
	}
	
	//通过图书Id查找图书
	public String findById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取参数
		String bookId = request.getParameter("bookId");
		Book book = service.findById(bookId);
		request.setAttribute("book", book);
		return "forward:/pages/before/product/productInfo.jsp";
	}
	
	//通过图书Id查找图书
	public String findByKeyword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取参数
		String bookName = request.getParameter("bookName");
		List<Book> bookList = service.findByKeyword(bookName);
		request.setAttribute("bookList", bookList);
		return "forward:/pages/before/product/productList.jsp";
	}

}
