package com.dao;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import com.connection.DBcon;

public class TestDAO {
	
private static TestDAO instance = null;
	
	private TestDAO() {}
	
	public static TestDAO getInstance() {
		if (instance == null) {
			synchronized (TestDAO.class) {
				instance = new TestDAO();
			}
		}
		
		return instance;
	}
	
	
	public void testInsert(TestVO article) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String test1= "test1";
		String test2 = "test2";
		
		String sql1= "insert into test(test1,test2) values(test1,test2)";
		
		
		
		try {
			con = DBcon.getConnection();
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			String sql2 = "insert into test(test1,test2) values(?,?)";
			
			pstmt.setString(1, test1);
			pstmt.setString(2, test2);
			
			pstmt.execute();
				
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			
			if (rs != null) {	try {rs.close();} catch (SQLException s) {}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException s) {}}
			if (con != null) {try {con.close();} catch (SQLException s) {}}
			
			
		}
		
		
		
		
		
		
	}
	
	
	
	
	
	
}
