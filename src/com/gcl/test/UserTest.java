package com.gcl.test;

import org.junit.Test;

import com.gcl.bean.User;
import com.gcl.dao.UserDao;

public class UserTest {
	
	UserDao dao = new UserDao();
	
	//测试添加
	@Test
	public void addTest() {
		User user = new User();
		user.setUserId("0012");
		user.setUsername("zhangsan2");
		user.setPassword("123");
		user.setEmail("dasdasd@qq.com");
		dao.add(user);

	}
}
