package com.gcl.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Category;
import com.gcl.exception.AdminException;
import com.gcl.service.CategoryService;
import com.gcl.servlet.MyServlet;

public class AdminCategoryServlet extends MyServlet {
	
	private CategoryService service = new CategoryService();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	}
	
	/**
	 * 查看分类
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		List<Category> categoryList = service.findAllCategory();
		request.setAttribute("categoryList", categoryList);
		return "forward:/pages/after/categoryQuery.jsp";
	}
	
	/**
	 * 添加分类
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		Category category = CommonUtils.toBean(request.getParameterMap(), Category.class);
		//设置id
		category.setCategoryId(CommonUtils.uuid());
		try {
			service.addCategory(category);
			request.setAttribute("msg", "分类添加成功！");
			return "forward:/pages/after/tip.jsp";
		} catch (AdminException e) {
			request.setAttribute("category", category);
			request.setAttribute("msg", e.getMessage());
			return "forward:/pages/after/addCategory.jsp";
		}
	}
	
	/**
	 * 修改分类之前
	 */
	public String updatePre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		String categoryName = request.getParameter("categoryName");
		//得到分类的信息
		Category category = service.findByCategoryName(categoryName);
	 
		request.setAttribute("category", category);
		return "forward:/pages/after/categoryUpdate.jsp";
	}
	/**
	 * 修改分类
	 */
	public String update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数(要自己传递过来id)
		Category category = CommonUtils.toBean(request.getParameterMap(), Category.class);
		service.updateCategory(category);
		request.setAttribute("msg", "修改成功！");
		return "forward:/pages/after/tip.jsp";
	}
	
	/**
	 * 删除分类
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取参数
		String categoryId = request.getParameter("categoryId");
		service.deleteByCategoryId(categoryId);
		request.setAttribute("msg", "删除分类成功！");
		return "forward:/pages/after/tip.jsp";
	}

}
