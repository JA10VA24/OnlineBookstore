package com.gcl.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gcl.bean.Cart;
import com.gcl.bean.User;
import com.gcl.exception.UserException;
import com.gcl.service.UserService;

import cn.itcast.commons.CommonUtils;


public class UserServlet extends MyServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService service = new UserService();
	
	//注册
	public String regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//处理编码问题
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取参数并封装
		User user = CommonUtils.toBean(request.getParameterMap(), User.class);
		user.setUserId(CommonUtils.uuid());  			//补全信息（用户独一无二的id）
		/*
		 * 验证参数是否正确
		 * 用map保存错误信息，如果有错误就返回
		 */
		String result = null;
		Map<String, String> map = new HashMap<String, String>();
		// 获取参数
		String username = user.getUsername();
		if (username == null || username.trim().isEmpty()) {
			map.put("username", "x用户名不能为空！");
			request.setAttribute("user", user);	
			request.setAttribute("map", map);			
			return "forward:/pages/before/user/regist.jsp";
		}
		String password = user.getPassword();
		if (password == null || password.trim().isEmpty()) {
			map.put("password", "x密码不能为空！");
			request.setAttribute("user", user);	
			request.setAttribute("map", map);			
			return "forward:/pages/before/user/regist.jsp";
		}
		String password2 = request.getParameter("password2");
		if(!password.equals(password2)) {
			map.put("password2", "x两次密码不一致！");
			request.setAttribute("user", user);	
			request.setAttribute("map", map);
			request.setAttribute("password2", password2);
			return "forward:/pages/before/user/regist.jsp";
		}
		String email = user.getEmail();
		if (email == null || email.trim().isEmpty()) {
			map.put("email", "x邮箱不能为空！");
			request.setAttribute("user", user);	
			request.setAttribute("map", map);
			request.setAttribute("password2", password2);
			return "forward:/pages/before/user/regist.jsp";
		} else if (!email.matches("\\w+@\\w+\\.\\w+")) {// wewe@qq.com
			map.put("email", "x邮箱格式不正确！");
			request.setAttribute("user", user);	
			request.setAttribute("map", map);
			request.setAttribute("password2", password2);
			return "forward:/pages/before/user/regist.jsp";
		}

		try {
			service.regist(user);
			result = "redirect:/msg.jsp";
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("user", user);
			request.setAttribute("password2", password2);
			result =  "forward:/pages/before/user/regist.jsp";
		}
		return result;
	}
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		User user = CommonUtils.toBean(request.getParameterMap(), User.class);
		//用map保存错误信息
		Map<String, String> map = new HashMap<String, String>(); 
		//获取参数
		String username = user.getUsername();
		if(username == null || username.trim().isEmpty()) {
			map.put("username", "请输入用户名");
			request.setAttribute("user", user);
			request.setAttribute("map", map);
			return "forward:/pages/before/user/login.jsp";
		}
		String password = user.getPassword();
		if(password == null || password.trim().isEmpty()) {
			map.put("password", "请输入密码");
			request.setAttribute("user", user);
			request.setAttribute("map", map);
			return "forward:/pages/before/user/login.jsp";
		}
		
		try {
			User data_user = service.login(user);			//登录
			HttpSession session = request.getSession();		//获取session
			session.setAttribute("user", data_user);		//将data_user保存到session中
			session.setAttribute("cart", new Cart()); 		//给用户创建一部购物车
			return "redirect:/index.jsp";
		} catch (UserException e) {
			request.setAttribute("user", user);
			String msg = e.getMessage();
			request.setAttribute("msg",msg );
		
			return "forward:pages/before/user/login.jsp";
		}
	}
	
	//退出
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		/*销毁session*/
		request.getSession().invalidate();
		
		return "redirect:/index.jsp"; 
	}
}
