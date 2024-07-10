package com.dao;

import java.sql.*;

import com.connection.DBcon;

public class OrderDAO {

	
	public void insertOrder(String loginID, String giftcode, int giftprice) {
		Connection conn = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		System.out.println(loginID);
		System.out.println(giftcode);
		
		String giftPrice = Integer.toString(giftprice);
		
		System.out.println(giftPrice);
		
		
		String sql = "INSERT INTO ACI_ORDER ( ordermember, ordergiftcode, orderprice) VALUES (?, ?, ?)";
		
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, loginID);
            pstmt.setString(2, giftcode);
            pstmt.setString(3, giftPrice );
            
            pstmt.executeUpdate();
		
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			DBcon.close(rs, pstmt, conn);
		}
	}
	
	public void deductMileage(String loginID, int amount) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE ACI_MEMBER SET mmileage = mmileage - ? WHERE mID = ?";

        try {
            conn = DBcon.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, amount);
            pstmt.setString(2, loginID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
	
	
	
}
