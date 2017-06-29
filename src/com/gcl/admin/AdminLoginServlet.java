package com.gcl.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Admin;
import com.gcl.exception.AdminException;
import com.gcl.service.AdminService;
import com.gcl.servlet.MyServlet;

public class AdminLoginServlet extends MyServlet {
	
	private AdminService service = new AdminService();

	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		Admin admin = CommonUtils.toBean(request.getParameterMap(), Admin.class);
		//通过service登录
		try {
			//登录成功，就把信息保存在session中
			 Admin data_admin = service.login(admin);
			 
			 request.getSession().setAttribute("admin", data_admin);
			 return "redirect:/pages/after/main.jsp";
		} catch (AdminException e) {
			e.printStackTrace();
			request.setAttribute("admin", admin);
			request.setAttribute("msg", e.getMessage());
			return "forward:/pages/after/login.jsp";
		}
	}
	
	
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		request.getSession().invalidate();
		return "redirect:/pages/after/login.jsp"; 
	}
}
