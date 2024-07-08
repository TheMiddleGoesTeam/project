package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.vo.BoardVO;
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
				"insert into ACI_MEMBER(mID,mnic,mPass,mName,mTel1,mTel2,mTel3,mEmail) "
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
			 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
			 if(con != null) try {con.close();}catch(SQLException s){}
		}
		return flag;
	}	


/*
 * 	로그인 버튼을 클릭하면 우리가 입력한 id/pass를 데이터베이스에서 가져와서
 * 	비교해서 같으면 로그인 성공, 다르면 로그인 실패 처리해야 함
 * 
 * 	데이터베이스에서 아이디와 비밀번호를 비교한 결과를 정수형으로 리턴해주는
 * 	메소드를 구현함
 * 	1:로그인성공, 0:비밀번호 틀림, -1:아이디가 존재하지 않음
 */

public int loginCheck(String mID, String mPass) {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null; 
	int check=-1;// 아이디가 없음(초기값)
	
	try {
	
		con =DBcon.getConnection();
		
		String sql="select mPass from ACI_MEMBER where mID=?";//아이디를 가지고 비밀번호가 있는지
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mID);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {//아이디로 비밀번호를 조회했다.
			String dbPass = rs.getString("mPass");
			if(mPass.equals(dbPass)) check =1;
			else check=0;
		}
	}catch(SQLException ss) {
		ss.printStackTrace();
	}finally {
		 if(rs != null) try {rs.close();}catch(SQLException s){}
		 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
		 if(con != null) try {con.close();}catch(SQLException s){}
	}
	return check;
	
}//end loginCheck

/*
 * 		로그인한 회원정보를 수정하기 위해서는 회원정보를 데이터베이스에서
 * 		가져와야함
 */
public MemberVO getMember(String mID) {//아이디 파라미터로 회원정보 가져옴
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null; 
	MemberVO vo=null;//반환형 객체
	
	try {
		
		con =DBcon.getConnection();//db 연결
		String sql="select * from ACI_MEMBER where mID=?";//모든 정보
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, mID);
		
		rs=pstmt.executeQuery();
		if(rs.next()) {//조회한 아이디에 해당하는 회원정보가 존재한다면
			vo = new MemberVO();
			vo.setmID(rs.getString("mID"));//db에서 가져옴
			vo.setmNic(rs.getString("mNic"));
			vo.setmPass(rs.getString("mPass"));
			vo.setmName(rs.getString("mName"));
			vo.setMtel1(rs.getString("mTel1"));
			vo.setMtel2(rs.getString("mTel2"));
			vo.setMtel3(rs.getString("mTel3"));
			vo.setmEmail(rs.getString("mEmail"));

		    }
		}catch(SQLException ss) {
	
		}finally {
		 if(rs != null) try {rs.close();}catch(SQLException s){}
		 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
		 if(con != null) try {con.close();}catch(SQLException s){}
	}
	return vo;	
}//end getMember

	public void updateMember(MemberVO mvo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			
			con=DBcon.getConnection();
			String sql="update ACI_MEMBER set mNic=?, mPass=?, mName=? ,mTel1=?, mTel2=?, "
					+ "mTel3=?, mEmail=? where mID=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, mvo.getmNic());
			pstmt.setString(2, mvo.getmPass());
			pstmt.setString(3, mvo.getmName());
			pstmt.setString(4, mvo.getMtel1());
			pstmt.setString(5, mvo.getMtel2());
			pstmt.setString(6, mvo.getMtel3());
			pstmt.setString(7, mvo.getmEmail());
			pstmt.setString(8, mvo.getmID());
			
			pstmt.executeUpdate();
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
		 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
		 if(con != null) try {con.close();}catch(SQLException s){}
	}
	}//end updateMember
	
	//회원삭제처리
	/*
	 * 		deleteForm에서 탈퇴버튼을 클릭하면 실제 데이터베이스에서
	 * 		회원정보를 삭제해야함
	 * 		삭제처리하는 기능을 구현한다.
	 */
	public int deleteMember(String mID, String mPass) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; //rs에서 가져와야하니까
		
		String dbPass=""; //데이터베이스에 저장된 패스워드를 저장하는 변수
		int result=-1; //아이디가 존재하지 않습니다.
		
		try {
			
			con=DBcon.getConnection();
			String sql1="select mPass from ACI_MEMBER where mID=?";//아이디로 패스워드가 있는지없는지
			pstmt=con.prepareStatement(sql1);
			pstmt.setString(1, mID);//아이디검색해서 비밀번호 알아내고
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {//아이디가 있을 때
				dbPass=rs.getString("mPass");
				if(dbPass.equals(mPass)) {//본인확인여부
					// 비밀번호가 일치하면 삭제 처리함
					String sql2="delete from ACI_MEMBER where mID=?";
					pstmt=con.prepareStatement(sql2);
					pstmt.setString(1, mID);
					pstmt.executeUpdate();
					result =1;// 회원탈퇴 성공
				}else {// 본인 확인 실패
					result=0;
				}
			}
			}catch(SQLException ss) {
				ss.printStackTrace();
			}finally {
			 if(rs != null) try {rs.close();}catch(SQLException s){}
			 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
			 if(con != null) try {con.close();}catch(SQLException s){}
		}
		return result;
	}//end deleteMember
	
	public boolean idCheck(String mID) {
		boolean result = true;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DBcon.getConnection();
			String sql = "select * from ACI_MEMBER where mID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mID);
			
			rs= pstmt.executeQuery();
			
			if(!rs.next())
				result = false;
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally{
			
			DBcon.close(rs, pstmt, con);
		}
		
		return result;

	}//end idCheck
	
	public int admincheck(String loginID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int admincheck = -1;
		String mcatgory="";
		
		try {
				con = DBcon.getConnection();
				String sql = "select mcat from ACI_MEMBER where mID=?";
		
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, loginID);
				rs=pstmt.executeQuery();

				if(rs.next()) {//아이디로 비밀번호를 조회했다.
					mcatgory =rs.getString("mCat");
				if(mcatgory.equals("n"))
					admincheck =-1;
				else if(mcatgory.equals("y")) {
					admincheck = 1;
					}
				}
				
			}catch(SQLException ss) {
				ss.printStackTrace();
			}finally{
				
				DBcon.close(rs, pstmt, con);
			}
		return admincheck;
	}
	
	
	
	private static MemberDAO instance = null;
	
	public static MemberDAO getInstance() {
		if(instance==null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}
	



public List<MemberVO> admingetMember(){
	
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql = "select * from ACI_MEMBER order by mNum asc";
	
	List<MemberVO> adminMemberList=null;
	
	try {

		conn= DBcon.getConnection();
		pstmt=conn.prepareStatement(sql);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			adminMemberList = new ArrayList<MemberVO>();
				do {
					MemberVO mvo = new MemberVO();
					mvo.setmNum(rs.getString("mNum"));
					mvo.setmID(rs.getString("mID"));
					mvo.setmNic(rs.getString("mNic"));
					mvo.setmMileage(rs.getInt("mMileage"));;
					adminMemberList.add(mvo);
				}while(rs.next());
			}
		
		
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			DBcon.close(rs, pstmt, conn);
		}
		return adminMemberList;
	}
	

public void remove(int mNum) {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null; 
	
	try {
		
		con=DBcon.getConnection();
		
				String sql2="delete from ACI_MEMBER where mnum=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setInt(1, mNum);
				pstmt.executeUpdate();
		
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
		 if(rs != null) try {rs.close();}catch(SQLException s){}
		 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
		 if(con != null) try {con.close();}catch(SQLException s){}
	}
	
}//end deleteMember












	
	
}







