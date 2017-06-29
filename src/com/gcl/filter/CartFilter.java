package com.gcl.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcl.bean.Cart;


/**
 * 拦截加入购物车的过滤器
 * 如果用户没登录，就不能把商品放入购物车
 */
public class CartFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		//先将参数转换一下
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		/*
		 * 原则上是用户登录了才会有购物车，没登录就没有购物车
		 */
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null) { //如果没有购物车，说明没登录，就不放行
			request.setAttribute("msg","登录后才能使用这些功能");
			response.sendRedirect(request.getContextPath() + "/pages/before/user/login.jsp" );
			return;
		}else {
			arg2.doFilter(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
