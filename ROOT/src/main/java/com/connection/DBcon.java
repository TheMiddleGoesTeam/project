package com.connection;

import java.sql.*;

import javax.sql.*;
 
public class DBcon {
	
	private static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	private static final String DB_URL = "jdbc:mariadb://183.111.242.22:3306/themgt";
	private static final String USER = "themgt";
	private static final String PASS = "Themiddle1";
	
	public static Connection getConnection() throws SQLException {
        try {
            Class.forName(JDBC_DRIVER);
            return DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Failed to load JDBC driver", e);
        }
    }
	
	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt != null) {
			try {
				if(!stmt.isClosed())
					stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		
		if(conn !=null) {
			try {
				if(!conn.isClosed())
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
		
		
	}

	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		
		if(rs != null) {
			try {
				if(!rs.isClosed())
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				rs=null;
			}
		}
		
			
		if(stmt != null) {
			try {
				if(!stmt.isClosed())
					stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		
		if(conn !=null) {
			try {
				if(!conn.isClosed())
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
		
		
	}
	
	

    
}
