package com.gcl.service;

import com.gcl.bean.Admin;
import com.gcl.dao.AdminDao;
import com.gcl.exception.AdminException;


public class AdminService {
	private AdminDao dao = new AdminDao(); 
	
	/**
	 * 管理员登录
	 * @throws AdminException 
	 */
	public Admin login(Admin admin) throws AdminException {
		Admin data_admin = dao.findByName(admin.getAdminName());
		if(data_admin == null) {
			throw new AdminException("账号或密码错误！");
		}
		if(!data_admin.getAdminPassword().equals(admin.getAdminPassword())) {		//判断密码
			throw new AdminException("账号或密码错误！");
		}
		return data_admin;
	}
}
