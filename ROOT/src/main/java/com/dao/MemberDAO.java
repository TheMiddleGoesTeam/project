package com.dao;

import java.sql.*;
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
			String sql = "insert into aci_member values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getmID());
			pstmt.setString(2, vo.getmNic());
			pstmt.setString(3, vo.getmPass());
			pstmt.setString(4, vo.getmName());
			pstmt.setString(5, vo.getmTel());
			pstmt.setString(6, vo.getmEmail());
			
			int count = pstmt.executeUpdate();
			if (count > 0) {
				flag = true;
			}
			
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
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
		return flag;
	}
	
	public int loginCheck(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;
		
		try {
			con = getConnection();
			String sql = "select pass from aci_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String dbPass = rs.getString("pass");
				if (pass.equals(dbPass)) {
					check = 1;
				} else {
					check = 0;
				}
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
		
		return check;
	}
	
	public MemberVO getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = null;
		
		try {
			con = getConnection();
			String sql="select * from aci_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO();
				vo.setmID(rs.getString("id"));
				vo.setmNic(rs.getString("nic"));
				vo.setmPass(rs.getString("pass"));
				vo.setmName(rs.getString("name"));
				vo.setmTel(rs.getString("tel"));
				vo.setmEmail(rs.getString("email"));
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
		
		return vo;
	}
	
	public void updateMember(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "update aci_member set nic = ?, pass = ?, name = ?, tel = ?, email = ?, where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getmID());
			pstmt.setString(2, vo.getmNic());
			pstmt.setString(3, vo.getmPass());
			pstmt.setString(4, vo.getmName());
			pstmt.setString(5, vo.getmTel());
			pstmt.setString(6, vo.getmEmail());
			
			
			pstmt.executeUpdate();
			
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
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
	}
	
	// deleteForm에서 회원탈퇴 버튼을 클릭하면 실제 데이터베이스에서 회원정보를 삭제하는 기능 구현
	
	public int deleteMember(String id, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPass = ""; // 데이터베이스에 저장된 패스워드를 저장하는 변수
		int result = -1;
		
		try {
			con = getConnection();
			String sql1 = "select pass from aci_member where id = ?";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbPass = rs.getString("pass");
				if (dbPass.equals(pass)) { // 본인 확인
					String sql2 = "delete from aci_member where id = ?";
					pstmt = con.prepareStatement(sql2);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1;
				} else {
					result = 0;
				}
			}
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
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
}