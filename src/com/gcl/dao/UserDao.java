package com.gcl.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.gcl.bean.User;
import com.gcl.utils.JdbcUtils;


/**
 *dao层：与数据库打交道的 
 *
 */
public class UserDao {
	//dbUtils:用来处理sql语句的
	QueryRunner qr = new QueryRunner(JdbcUtils.getDateSource());
	
	/**
	 * 根据用户名查找
	 */
	public User findByUsername(String username) {
		String sql = "select * from t_user where username=?";
		Object[] params = {username};
		User user = null;
		try {
			user = qr.query(sql, new BeanHandler<User>(User.class), params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 添加：添加用户到t_user表中
	 */
	public void add(User user) {
		String sql = "insert into t_user values(?,?,?,?)";
		Object[] params = {user.getUserId(),user.getUsername(),user.getPassword(),user.getEmail()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
