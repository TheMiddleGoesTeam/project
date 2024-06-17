package com.dao;

import java.sql.*;

public class Cafe24MariaDBConnection {

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
    
    
    public static void main(String[] args) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;
        
        

        String test1= "test1";
		String test2 = "test2";
		
		String sql1= "insert into test(test1,test2) values(test1,test2)";
		
		try {
			
			System.out.println("Connected to Cafe24 MariaDB successfully!");
			con = getConnection();
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			
			pstmt.execute();
			
			
			
		}catch(SQLException se){
			se.printStackTrace();
		}finally {
			if (rs != null) {	try {rs.close();} catch (SQLException s) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException s) {}}
			if (con != null) {try {con.close();} catch (SQLException s) {}}
			
		}
		
		
		
		
		
		
        con.close();
    }
}
    
    
	
	
	

