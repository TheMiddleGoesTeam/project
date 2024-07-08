package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.connection.DBcon;
import com.vo.BoardVO;
import com.vo.Board_NoticeVO
;
public class Board_NoticeDAO {

	private static Board_NoticeDAO instance = null;
	private Board_NoticeDAO(){	}
	
	public static Board_NoticeDAO getInstance() {
		if(instance==null) {
			synchronized (Board_NoticeDAO.class) {
				instance = new Board_NoticeDAO();
			}
		}
		return instance;
	}
	
	public void insertArticle(Board_NoticeVO vo) {
		Connection conn = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		int num = vo.getnNum();
		int ref= vo.getnRef();
		int step= vo.getnStep();
		int depth = vo.getnDepth();
		int number=0;
		String sql1="select max(nnum) from ACI_BOARD_NOTICE";
		String sql2="update ACI_BOARD_NOTICE set nStep = nStep+1 where nRef=? and nStep > ?";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
		
			
			if(rs.next()) { number = rs.getInt(1)+1;}
			else number =1;
			
			if(num != 0) {//답변글 일 경우
				pstmt= conn.prepareStatement(sql2);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				
				pstmt.executeUpdate();
				step = step+1;
				depth = depth+1;
			}else {//새글일 경우
				ref = number;
				step = 0;
				depth=0;
			}
			String sql3="insert into ACI_BOARD_NOTICE(nTitle, nWriter, nPass,nRef,nStep,nDepth, nContents) "
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql3);
			
			
			pstmt.setString(1, vo.getnTitle());
			pstmt.setString(2,vo.getnWriter());
			pstmt.setString(3, vo.getnPass());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, step);
			pstmt.setInt(6, depth);
			pstmt.setString(7,vo.getnContents());
			
	
			pstmt.executeUpdate();
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
			if(conn != null)try{conn.close();}catch(SQLException s){s.printStackTrace();}
		}
		
	}//end insertArticle
    
	/*
	 *글을 추가한 후 리다이렉트로 리스트 페이지를 보여줌
	 *전체 글의 개수를 가져와서 목록을 보여줌 
	 */
	public int getArticleCount() {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=0;
		try {
			conn= DBcon.getConnection();
			String sql="select count(*) from ACI_BOARD_NOTICE";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
			if(conn != null)try{conn.close();}catch(SQLException s){s.printStackTrace();}
		}
		return x;
	}//end count
	
	
	public List<Board_NoticeVO> getArticles(int start,int end){//수정 필요 모르겠음,,
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<Board_NoticeVO> articleList=null;
		
		try {
			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement("select * from ACI_BOARD_NOTICE order by nNum desc LIMIT ?, 5");
			pstmt.setInt(1, start);
	       
			
	        
			rs=pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList<Board_NoticeVO>();
				do {
					Board_NoticeVO vo = new Board_NoticeVO();
					vo.setnNum(rs.getInt("nNum"));
					vo.setnTitle(rs.getString("nTitle"));
					vo.setnWriter(rs.getString("nWriter"));
					vo.setnPass(rs.getString("nPass"));
					vo.setnDate(rs.getTimestamp("nDate"));
					vo.setnReadCount(rs.getInt("nReadcount"));
					vo.setnRef(rs.getInt("nRef"));
					vo.setnStep(rs.getInt("nStep"));
					vo.setnDepth(rs.getInt("nDepth"));
					vo.setnContents(rs.getString("nContents"));
		
					articleList.add(vo);
				}while(rs.next());
			}
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
			if(conn != null)try{conn.close();}catch(SQLException s){s.printStackTrace();}
		}
		return articleList;
	}//end getArticles(0

	
	/*글 상세보기
	 *  글 제목을 누르면 글 상세보기를 할 수 있다.
	 *  글 번호를 매개변수로 해서 하나의 글에 대한 세부정보를 
	 *  가져오는 메소드 구현
	 */

	public Board_NoticeVO getArticle(int num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Board_NoticeVO article =null;
		try {
			con=DBcon.getConnection();
			String sql1 = "update ACI_BOARD_NOTICE set nReadcount = nReadcount+1 where nNum=?";//조회수 증가
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql2="select * from ACI_BOARD_NOTICE where nNum=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();	
			
			if(rs.next()) {
				article = new Board_NoticeVO();
				article.setnNum(rs.getInt("nNum"));
				article.setnWriter(rs.getString("nWriter"));
				article.setnTitle(rs.getString("nTitle"));
				article.setnPass(rs.getString("nPass"));
				article.setnDate(rs.getTimestamp("nDate"));
				article.setnReadCount(rs.getInt("nReadcount"));
				article.setnRef(rs.getInt("nRef"));
				article.setnStep(rs.getInt("nStep"));
				article.setnDepth(rs.getInt("nDepth"));
				article.setnContents(rs.getString("nContents"));
			}
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
		}
		return article;
	}//end
	
 public Board_NoticeVO updateGetArticle(int num) {
		   Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Board_NoticeVO article =null;
			
			 try {
					con=DBcon.getConnection();
					String sql="select * from ACI_BOARD_NOTICE where nNum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,num);
					rs=pstmt.executeQuery();	
					
					if(rs.next()) {
						article = new Board_NoticeVO();
						article.setnNum(rs.getInt("nNum"));
						article.setnWriter(rs.getString("nWriter"));
						article.setnTitle(rs.getString("nTitle"));
						article.setnPass(rs.getString("nPass"));
						article.setnDate(rs.getTimestamp("nDate"));
						article.setnReadCount(rs.getInt("nReadcount"));
						article.setnRef(rs.getInt("nRef"));
						article.setnStep(rs.getInt("nStep"));
						article.setnDepth(rs.getInt("nDepth"));
						article.setnContents(rs.getString("nContents"));
					}
			   }catch (SQLException s) {
					s.printStackTrace();
				}finally{
					if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
					if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
					if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
				}
				return article;
	   }	//end
	
	
	  /*
	    * 데이터 베이스에 실제 글이 수정되어야함
	    */
	 public int updateArticle(Board_NoticeVO vo) {
		   Connection con = null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   String dbpasswd="";	
		   String sql1="";
		   String sql2="";
			int result=-1;
		 try {
			   con=DBcon.getConnection();
			   sql1="select fPass from ACI_BOARD_NOTICE where nNum=?";
			   pstmt = con.prepareStatement(sql1);
			   pstmt.setInt(1,vo.getnNum());
			   rs= pstmt.executeQuery();
			   if(rs.next()) {
				   dbpasswd=rs.getString("nPass");
				   if(dbpasswd.equals(vo.getnPass())) {
					   sql2="update ACI_BOARD_NOTICE set nWriter=?, nTitle=?, nContents=? where nNum=? ";
					   pstmt= con.prepareStatement(sql2);
					   
					   pstmt.setString(1,vo.getnWriter());
					   pstmt.setString(2,vo.getnTitle());
					   pstmt.setString(3,vo.getnContents());
					   pstmt.setInt(4,vo.getnNum());
					   pstmt.executeUpdate();
					   result=1;
				   }else {
					   result=0;
				   }
			   }
			 
		 }catch (SQLException s) {
				s.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
				if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
				if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
			}
		  return result;
	  }//end update
	 
 public int deleteArticle(int num, String pass) {
		   Connection con = null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   String dbpasswd="";	
		   String sql1="";
		   String sql2="";
		   int result=-1;
		   try {
			   con=DBcon.getConnection();
			   sql1="select rPass from ACI_BOARD_NOTICE where nNum=?";
			   pstmt = con.prepareStatement(sql1);
			   pstmt.setInt(1,num);
			   rs= pstmt.executeQuery();
			   
			   if(rs.next()) {
				   dbpasswd=rs.getString("nPass");
				   if(dbpasswd.equals(pass)) {
					   sql2="delete from ACI_BOARD_NOTICE where nNum=?";
					   pstmt=con.prepareStatement(sql2);
					   pstmt.setInt(1,num);
					   pstmt.executeUpdate();
					   result=1;//
				   }else {result=0;}// 비밀번호 오류
			   }
			   
		   }catch (SQLException s) {
				s.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
				if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
				if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
			}
		  return result;
	   }//end deleteArticle
	 
 
 //검색한 내용이 몇개 있는지 반환(what:검색조건, content: 검색내용)
  public int getArticleCount(String what, String content) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x=0;
		try {
			con= DBcon.getConnection();
			String sql="select count(*) from ACI_BOARD_NOTICE where "+what+" like '%"+content+"%'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
		}
		return x;
	}//end count
  
  
  public List<Board_NoticeVO> getAllBoardList(){//all_board에 3개 넣는 메소드
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<Board_NoticeVO> allboardList=null;
		
		try {
			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement("select * from ACI_BOARD_NOTICE order by nNum desc LIMIT 3");
			
			
	        
			rs=pstmt.executeQuery();
			if(rs.next()) {
				allboardList = new ArrayList<Board_NoticeVO>();
				do {
					Board_NoticeVO vo = new Board_NoticeVO();
					vo.setnNum(rs.getInt("nNum"));
					vo.setnTitle(rs.getString("nTitle"));
					vo.setnDate(rs.getTimestamp("nDate"));
					
		
					allboardList.add(vo);
				}while(rs.next());
			}
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			DBcon.close(rs, pstmt, conn);
		}
		return allboardList;
	}//end 
}
