package com.gcl.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gcl.bean.Book;
import com.gcl.bean.Cart;
import com.gcl.bean.CartItem;
import com.gcl.service.BookService;

public class CartServlet extends MyServlet {
	
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
	
	//添加到购物车
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		/**
		 * 当用户点击加入购物车时，跳转到此servlet
		 * 在这里我们要获取用户的购物车
		 */
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		//得到条目
		String bookId = request.getParameter("bookId");
		String countValue = request.getParameter("bookCount");
		int bookCount = Integer.parseInt(countValue);
		//得到book
		Book book = service.findById(bookId);
		//设置条目
		CartItem item = new CartItem();
		item.setBook(book);
		item.setBookCount(bookCount);
		//将条目添加进购物车
		cart.addCartItem(item);
		
		return "forward:/pages/before/product/cartList.jsp";
	}
	
	/**
	 * 清空购物车
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String clear(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		/**
		 * 1.得到车
		 * 2.清空车
		 */
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		cart.clearCart();
		return "forward:/pages/before/product/cartList.jsp";
	}
	
	/**
	 * 删除特定商品
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		//得到参数
		String bookId = request.getParameter("bookId");
		cart.deleteById(bookId);
		return "forward:/pages/before/product/cartList.jsp";
	}
	
	/**
	 * 查看我的购物车
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		return "forward:/pages/before/product/cartList.jsp";
	}
}
