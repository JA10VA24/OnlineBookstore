package com.gcl.utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;

import javax.sql.DataSource;



import org.junit.Test;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 *jdbc的工具类：用来连接数据库的 :ComboPooledDataSource
 *使用连接池来获取connection
 */

/*
 * 以前是用jdbc的，后来有了连接池就用连接池了，有了连接池对象就能获得我们最重要的collection
 */
public class JdbcUtils {
	//连接池对象:主要用连接池对象获得连接
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();
	
	/*
	 * 得到连接：考虑的问题就要多一点：这个连接池要兼顾事务，事务是一个事务一个连接不能搞错的
	 * 所以要把conn放到ThreadLocal里面
	 * ThreadLocal:用来处理成员变量的并发问题（是一个map）
	 */
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	/**
	 * 获得连接池对象
	 * @return DataSource
	 */
	public static DataSource getDateSource() {
		return dataSource;
	}
	
	/**
	 * 获得连接：（重要）
	 * @throws SQLException 
	 * 
	 */
	public static Connection getConnection() throws SQLException {
		Connection conn = tl.get();//看看这个集合里有没有
		if(conn != null) {
			return conn;
		}
		return dataSource.getConnection();
	}
	
	/**
	 * 第三个方法：开启事务并设置事务conn
	 * @throws SQLException 
	 */
	public static void startTransaction() throws SQLException {
		Connection conn = tl.get();
		if( conn != null) { //先判断线程里有没有conn
			throw new SQLException("已开启事务，请不要重复开启");
		}
		//如果不为空
		conn = getConnection();
		conn.setAutoCommit(false);//开启事务
		tl.set(conn);//然后将事务的连接放进thread里面
	}
	
	/**
	 * 第四个方法：提交事务
	 * @throws SQLException 
	 * 
	 */
	public static void commitTransaction() throws SQLException {
		Connection conn = tl.get();
		if( conn == null) { //先判断线程里有没有conn
			throw new SQLException("没有开启事务，无法提交");
		}
		/*
		 * 事务提交以后就不用这个conn了，要把它移除，方便其他人创建conn
		 */
		conn.commit();
		conn.close();
		tl.remove();
	}
	
	/**
	 * 第五个方法：回滚事务
	 * @throws SQLException 
	 */
	public static void rollbackTransaction() throws SQLException {
		Connection conn = tl.get();
		if( conn == null) { //先判断线程里有没有conn
			throw new SQLException("没有开启事务，无法回滚");
		}
		/*
		 * 事务提交/回滚以后就不用这个conn了，要把它移除，方便其他人创建conn
		 */
		conn.rollback();;
		conn.close();
		tl.remove();
	}
	
	/**
	 * 第六个方法：处理非事务连接的关闭问题：
	 * 如果一个连接是事务连接，那么我们在事务里面已经帮它完成关闭操作了，但一个conn如果是非事务连接呢？
	 * 并不知道我获得的是否为事务连接，如果我关闭了事务连接，其他的操作怎么办？
	 * @throws SQLException 
	 */
	public static void releaseConnection(Connection connection) throws SQLException {
		Connection conn = tl.get();
		if(conn == null) {//如果tl为空说明没有开启事务，这是普通连接
			connection.close();
		}else {
			if(conn != connection) {
				connection.close();
			}
		}
	}
	
	//测试能不能得打conn
	@Test
	public void test() throws SQLException {
		Connection conn = getConnection();
		System.out.println("连接池" + conn);
	}
	
}
