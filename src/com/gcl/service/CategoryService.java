package com.gcl.service;

import java.util.List;

import com.gcl.bean.Category;
import com.gcl.dao.CategoryDao;
import com.gcl.exception.AdminException;

public class CategoryService {
	
	CategoryDao dao = new CategoryDao();
	/**
	 * 查找所有的分类
	 */
	public List<Category> findAllCategory() {
		return dao.findAllCategory();
	}
	
	/**
	 * 通过分类名查询分类
	 */
	public Category findByCategoryName(String categoryName) {
		return dao.findByCategoryName(categoryName);
	}
	
	/**
	 * 添加分类
	 * @throws AdminException 
	 */
	public void addCategory(Category category) throws AdminException {
		
		Category c = dao.findByCategoryName(category.getCategoryName());
		if(c != null) {
			throw new AdminException("该分类已存在！");
		}
		dao.add(category);
	}
	
	/**
	 * 修改分类
	 * @throws AdminException 
	 */
	public void updateCategory(Category category) {
		
		dao.update(category);
	}
	
	/**
	 * 通过id删除分类
	 * @param categoryId
	 */
	public void deleteByCategoryId(String categoryId) {
		
		dao.deleteById(categoryId);
	}
	
	/**
	 * 通过id查找分类
	 */
	public Category findByCategoryId(String categoryId) {
		return dao.findByCategoryId(categoryId);
	}
}
