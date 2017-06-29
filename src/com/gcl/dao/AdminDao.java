package com.gcl.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.gcl.bean.Admin;
import com.gcl.utils.JdbcUtils;

public class AdminDao {
	
	private QueryRunner qr = new QueryRunner(JdbcUtils.getDateSource());
	
	/**
	 * 通过name查找管理员
	 */
	public Admin findByName(String adminName) {
		
		String sql = "select * from admin where adminName=?";
		Admin admin = null;
		try {
			admin = qr.query(sql, new BeanHandler<>(Admin.class), adminName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
}
