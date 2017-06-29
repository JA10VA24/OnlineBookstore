package com.test;

import java.util.List;

import org.junit.Test;

import com.gcl.bean.Category;
import com.gcl.dao.CategoryDao;
import com.gcl.service.CategoryService;

public class CategoryTest {
	CategoryDao dao = new CategoryDao();
	CategoryService service = new CategoryService();
	//查询所有分类
	@Test
	public void test() {
		List<Category> list = dao.findAllCategory();
		System.out.println(list);
	}

}
