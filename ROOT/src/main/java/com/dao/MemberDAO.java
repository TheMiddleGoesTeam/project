package com.dao;

import java.sql.*;
import com.vo.MemberVO;
import com.connection.DBcon;

public class MemberDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;

	public boolean memberInsert(MemberVO mvo) {
	
 		boolean flag = false;
		
		try {
			con = DBcon.getConnection();
			String sql = 
				"insert into ACI_MEMBER(mid,mnic,mpass,mname,mtel1,mtel2,mtel3,memail) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, mvo.getmID());
			pstmt.setString(2, mvo.getmNic());
			pstmt.setString(3, mvo.getmPass());
			pstmt.setString(4, mvo.getmName());
			pstmt.setString(5, mvo.getMtel1());
			pstmt.setString(6, mvo.getMtel2());
			pstmt.setString(7, mvo.getMtel3());
			pstmt.setString(8, mvo.getmEmail());
			
		
			int count = pstmt.executeUpdate();
			if (count > 0) {
				flag = true;
			}
			
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
			DBcon.close(pstmt, con);
		}
		return flag;
	}	
}