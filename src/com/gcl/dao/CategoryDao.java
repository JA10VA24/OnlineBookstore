package com.gcl.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.jdbc.JdbcUtils;

import com.gcl.bean.Category;

public class CategoryDao {
	
	QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
	/**
	 * 查询所有的分类
	 */
	public List<Category> findAllCategory() {
		List<Category> list = null;
		String sql = "select * from t_category";
		try {
			list = qr.query(sql, new BeanListHandler<>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 通过分类名查找分类
	 */
	public Category findByCategoryName(String categoryName) {
		
		Category category = null;
		String sql = "select * from t_category where categoryName=?";
		try {
			category = qr.query(sql, new BeanHandler<>(Category.class), categoryName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}
	
	/**
	 * 通过id查找分类
	 */
	public Category findByCategoryId(String categoryId) {
		
		Category category = null;
		String sql = "select * from t_category where categoryId=?";
		try {
			category = qr.query(sql, new BeanHandler<>(Category.class), categoryId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}
	
	/**
	 * 向分类表中添加信息
	 */
	public void add(Category category) {
		
		String sql = "insert into t_category values(?,?,?)";
		Object[] params = {category.getCategoryId(), category.getCategoryName(), category.getCategoryDesc()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改分类信息
	 */
	public void update(Category category) {
		
		String sql = "update t_category set categoryName=?, categoryDesc=? where categoryId=?";
		Object[] params = {category.getCategoryName(), category.getCategoryDesc(), category.getCategoryId()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过id删除分类
	 * @param categoryId
	 */
	public void deleteById(String categoryId) {
		
		String sql = "delete from t_category where categoryId=?";
		try {
			qr.update(sql, categoryId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
