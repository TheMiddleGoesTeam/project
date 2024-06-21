package com.dao;

import java.sql.*;
<<<<<<< HEAD
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
=======
import java.util.*;
import javax.sql.*;
import javax.naming.*;
import com.vo.MemberVO;

public class MemberDAO {
	
	private Connection getConnection() {
		Connection con = null;
		
		try {
			Context initContext = new InitialContext();
			DataSource ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("Connection 생성 실패");
		}
		return con;
	} // 데이터베이스 연결 메소드
	
	// 아이디 중복 체크 기능
	public boolean idCheck(String id) {
		
		boolean result = true;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String sql = "select * from aci_member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				result = false;
			}
			
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException s) {
					
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException s) {
					
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException s) {
					
				}
			}
		}
		
		return result;
	}
	
	
	public boolean memberInsert(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
 		boolean flag = false;
		
		try {
			con = getConnection(); 
			String sql = 
				"insert into aci_member(mnum,mid,mnic,mpass,mname,mtel1,mtel2,mtel3,memail,) "
				+ "values((select nvl(max(mnum),0)+1 from board), ?, ?, ?, ?, ?, ?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getmID());
			pstmt.setString(2, vo.getmNic());
			pstmt.setString(3, vo.getmPass());
			pstmt.setString(4, vo.getmName());
			pstmt.setString(5, vo.getmTel1());
			pstmt.setString(6, vo.getmTel2());
			pstmt.setString(7, vo.getmTel3());
			pstmt.setString(8, vo.getmEmail());
			
		
			
			int count = pstmt.executeUpdate();
			if (count > 0) {
				flag = true;
			}
			
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException s) {}}
			if (con != null) {try {con.close();} catch (SQLException s) {}}
		}
		return flag;
	}
	
	
	
>>>>>>> refs/remotes/origin/main
}