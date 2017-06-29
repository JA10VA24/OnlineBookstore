package com.gcl.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Book;
import com.gcl.bean.Category;
import com.gcl.service.BookService;
import com.gcl.service.CategoryService;
import com.gcl.servlet.MyServlet;

public class AdminBookServlet extends MyServlet {
	
	private BookService service = new BookService();
	CategoryService cs = new CategoryService();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	}
	
	/**
	 * 查询所有图书
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		List<Book> bookList = service.findAllBook();
		//获取所有分类
		List<Category> categoryList = cs.findAllCategory();
		request.setAttribute("bookList", bookList);
		request.setAttribute("categoryList", categoryList);
		return "forward:/pages/after/bookQuery.jsp";
	}
	
	/**
	 * 添加图书之前先要跳转到添加页面（包含分类）
	 */
	public String addPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取所有分类
		CategoryService cs = new CategoryService();
		List<Category> categoryList = cs.findAllCategory();
		request.setAttribute("categoryList", categoryList);
		return "forward:/pages/after/addbook.jsp";
	}
	/**
	 * 修改图书之前先要跳转到修改页面
	 */
	public String updatePre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		String bookId = request.getParameter("bookId");
		Book book = service.findById(bookId);
		//获取所有分类
		CategoryService cs = new CategoryService();
		List<Category> categoryList = cs.findAllCategory();
		request.setAttribute("book", book);
		request.setAttribute("categoryList", categoryList);
		return "forward:/pages/after/bookUpdate.jsp";
	}
	
	/**
	 * 修改图书
	 */
	public String update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数封装
		Book book = CommonUtils.toBean(request.getParameterMap(), Book.class);
		String categoryId = request.getParameter("categoryId");
		Category category = cs.findByCategoryId(categoryId);
		book.setCategory(category);
		service.updateBook(book);
		return findAll(request, response);
	}
	
	/**
	 * 通过id删除图书
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数封装
		String bookId = request.getParameter("bookId");
		service.deleteByBookId(bookId);
		return findAll(request, response);
	}
}
