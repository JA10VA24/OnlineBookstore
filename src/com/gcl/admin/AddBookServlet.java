package com.gcl.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.itcast.commons.CommonUtils;

import com.gcl.bean.Book;
import com.gcl.bean.Category;
import com.gcl.service.BookService;

public class AddBookServlet extends HttpServlet {
	
	private BookService service = new BookService();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		

		/*
		 * 有图片，所以需要使用上传
		 * 1.创建工厂
		 * 2.创建解析器
		 * 3.解析request获取信息
		 */
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//创建解析器
		ServletFileUpload sf = new ServletFileUpload(factory);
		//解析request获得数据
		try {
			List<FileItem> fileList = sf.parseRequest(request);
			//fileList就是获取的数据，对数据进行拆分封装
			Map<String, Object> map = new HashMap<>();
			for (FileItem fileItem : fileList) {
				//如果是表单项
				if(fileItem.isFormField()) {
					map.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
				}
			}
			Book book = CommonUtils.toBean(map, Book.class);
			book.setBookId(CommonUtils.uuid());
			
			book.setDel(false);
			Category category = CommonUtils.toBean(map, Category.class);
			book.setCategory(category);
			/*
			 * 保存上传的文件：
			 * 1.要有路径
			 * 2.图片的文件名
			 */
			//得到保存的路径：eclipse下的
			String savePath = this.getServletContext().getRealPath("/bookimages");
			//得到文件名
			String fileName = fileList.get(2).getName();
			//使用目录和文件名来保存最终的带后缀的路径：bookimages/bg1.jpg
			File destFile = new File(savePath, fileName);
			//保存文件到目标文件夹里去
			fileList.get(2).write(destFile);
			
			//设置商品的图片，即是数据里的路径
			book.setBookImg("bookimages/" + fileName);
			if(!fileName.toLowerCase().endsWith("jpg")) {
				request.setAttribute("msg", "图片必须是jpg格式的");
				request.getRequestDispatcher("/pages/after/addBook.jsp").forward(request, response);
			}
			
			service.addBook(book);
			
			//返回图书列表
			request.getRequestDispatcher("/AdminBookServlet?method=findAll").forward(request, response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
