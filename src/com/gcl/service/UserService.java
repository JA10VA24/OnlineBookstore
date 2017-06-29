package com.gcl.service;

import com.gcl.bean.User;
import com.gcl.dao.UserDao;
import com.gcl.exception.UserException;



/**
 *业务层：处理业务的 
 *
 */
public class UserService {
	
	UserDao dao = new UserDao(); 
	/**
	 * 注册业务：
	 * 处理用户的注册
	 * @throws UserException 
	 */
	public void regist(User user) throws UserException {
		//看看数据库中是否已经存在该用户
		User data_user = dao.findByUsername(user.getUsername());
		if(data_user != null) {
			throw new UserException("用户名已存在！");
		}
		//如果没有，就注册
		dao.add(user);
	}
	
	/**
	 * 登录业务：
	 * @throws UserException 
	 */
	public User login(User user) throws UserException {
		User data_user = dao.findByUsername(user.getUsername());		//看看数据库中是否已经存在该用户
		if(data_user == null) {
			throw new UserException("账号不存在！");
		}
		if(!data_user.getPassword().equals(user.getPassword())) {		//判断密码
			throw new UserException("密码错误！");
		}
		return data_user;
	}
}
