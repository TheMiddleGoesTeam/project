package com.dao;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBcon {
	private static DataSource ds;
	
	static {
		try {
			Context initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/themgt");
		} catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	
}
	