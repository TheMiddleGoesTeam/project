package com.dao;

import java.sql.*;
import com.connection.DBcon;
import java.sql.*;

import com.vo.MemberVO;

public class MileageDAO {

	public int showmilleage(String loginID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int mile =0;
		
		
		try {
			con = DBcon.getConnection();
			
			String sql1 = "select mMileage from ACI_MEMBER where mid=? ";
			pstmt=con.prepareStatement(sql1);
			pstmt.setString(1, loginID);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
			mile = rs.getInt("mMileage");}
		
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			DBcon.close(rs, pstmt, con);
		}	
		return mile;
	}

	
	
	public int mileagePlus(String loginID) {

		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int mile =0;
		
		
		try {
			
			con = DBcon.getConnection();
			
			String sql1 = "select mMileage from ACI_MEMBER where mid=? ";
			pstmt=con.prepareStatement(sql1);
			pstmt.setString(1, loginID);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
			mile = rs.getInt("mMileage");}
		
			mile = mile+100;
			
			String sql2 = "update ACI_MEMBER set mMileage=? where mID=?";
			pstmt=con.prepareStatement(sql2);
			pstmt.setInt(1, mile);
			pstmt.setString(2, loginID);
			
			pstmt.executeUpdate();
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			DBcon.close(rs, pstmt, con);
		}	
		return mile;
		
	}
	
	
	
	
}
