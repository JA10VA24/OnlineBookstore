package com.gcl.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *通过反射执行内部方法的基类 
 *
 */
public abstract class MyServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//在service里面获取用户的参数，因为service一直在执行，就是通过它来调用doGet和doPost的
		String methodName = request.getParameter("method");
		//先在这里进行初步的判断，确定得到的method没有异常
		if(methodName == null || methodName.trim().isEmpty()) {
			throw new RuntimeException("您没有传递method参数，无法确定调用哪个方法！");
		}
		
		Class<? extends MyServlet> clazz = this.getClass();
		//获得反射的方法，具体用哪个方法，是通过方法名，和方法参数确定的，servlet这个特殊的类，参数都是一样的，所以只是方法名不一样
		Method method = null;
		try {
			method = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class );
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("您要调用的方法：" + methodName + "不存在！");
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//到这里之后就说明方法是存在的:开始调用
		try {
			//相当于this.add(request,response);
			String result = (String)method.invoke(this, request,response);
			/**
			 * 得到一个字符串，判断
			 */
			if(result == null || result.trim().isEmpty()) {
				throw new RuntimeException("请输入路径");
			}
			//不为空的判断
			if(result.contains(":")) {
				//把字符串分割
				String[] arr = result.split(":");
				String param = arr[0];
				String path = arr[1];
				if(param.equalsIgnoreCase("forward")) {
					request.getRequestDispatcher(path).forward(request, response);
				}else if(param.equalsIgnoreCase("redirect")) {
					response.sendRedirect(request.getContextPath() + path);
				}else {
					throw new RuntimeException(param + "不是内部指令，不能完成跳转");
				}
			
			}else {
				throw new RuntimeException("路径格式不正确，请确保输入正确！");
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

}
