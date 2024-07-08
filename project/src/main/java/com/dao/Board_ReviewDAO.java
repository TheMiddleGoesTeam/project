package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.connection.DBcon;
import com.vo.BoardVO;
import com.vo.Board_ReviewVO;
public class Board_ReviewDAO {

	private static Board_ReviewDAO instance = null;
	private Board_ReviewDAO(){	}
	
	public static Board_ReviewDAO getInstance() {
		if(instance==null) {
			synchronized (Board_ReviewDAO.class) {
				instance = new Board_ReviewDAO();
			}
		}
		return instance;
	}
	
	public void insertArticle(Board_ReviewVO vo) {
		Connection conn = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		int num = vo.getrNum();
		int ref= vo.getrRef();
		int step= vo.getrStep();
		int depth = vo.getrDepth();
		int number=0;
		String sql1="select max(rnum) from ACI_BOARD_REVIEW";
		String sql2="update ACI_BOARD_REVIEW set rStep = rStep+1 where rRef=? and rStep > ?";
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
			String sql3="insert into ACI_BOARD_REVIEW(rTitle, rWriter, rPass,rRef,rStep,rDepth, rContents) "
					+ "values(?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql3);
			
			
			pstmt.setString(1, vo.getrTitle());
			pstmt.setString(2,vo.getrWriter());
			pstmt.setString(3, vo.getrPass());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, step);
			pstmt.setInt(6, depth);
			pstmt.setString(7,vo.getrContents());
			
	
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
			String sql="select count(*) from ACI_BOARD_REVIEW";
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
	
	
	public List<Board_ReviewVO> getArticles(int start,int end){//수정 필요 모르겠음,,
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<Board_ReviewVO> articleList=null;
		
		try {
			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement("select * from ACI_BOARD_REVIEW order by rNum desc LIMIT ?, 5");
			pstmt.setInt(1, start);
	       
			
	        
			rs=pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList<Board_ReviewVO>();
				do {
					Board_ReviewVO vo = new Board_ReviewVO();
					vo.setrNum(rs.getInt("rNum"));
					vo.setrTitle(rs.getString("rTitle"));
					vo.setrWriter(rs.getString("rWriter"));
					vo.setrPass(rs.getString("rPass"));
					vo.setrDate(rs.getTimestamp("rDate"));
					vo.setrReadCount(rs.getInt("rReadcount"));
					vo.setrRef(rs.getInt("rRef"));
					vo.setrStep(rs.getInt("rStep"));
					vo.setrDepth(rs.getInt("rDepth"));
					vo.setrContents(rs.getString("rContents"));
		
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

	public Board_ReviewVO getArticle(int num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Board_ReviewVO article =null;
		try {
			con=DBcon.getConnection();
			String sql1 = "update ACI_BOARD_REVIEW set rReadcount = rReadcount+1 where rNum=?";//조회수 증가
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql2="select * from ACI_BOARD_REVIEW where rNum=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();	
			
			if(rs.next()) {
				article = new Board_ReviewVO();
				article.setrNum(rs.getInt("rNum"));
				article.setrWriter(rs.getString("rWriter"));
				article.setrTitle(rs.getString("rTitle"));
				article.setrPass(rs.getString("rPass"));
				article.setrDate(rs.getTimestamp("rDate"));
				article.setrReadCount(rs.getInt("rReadcount"));
				article.setrRef(rs.getInt("rRef"));
				article.setrStep(rs.getInt("rStep"));
				article.setrDepth(rs.getInt("rDepth"));
				article.setrContents(rs.getString("rContents"));
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
	
 public Board_ReviewVO updateGetArticle(int num) {
		   Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Board_ReviewVO article =null;
			
			 try {
					con=DBcon.getConnection();
					String sql="select * from ACI_BOARD_REVIEW where rNum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,num);
					rs=pstmt.executeQuery();	
					
					if(rs.next()) {
						article = new Board_ReviewVO();
						article.setrNum(rs.getInt("rNum"));
						article.setrWriter(rs.getString("rWriter"));
						article.setrTitle(rs.getString("rTitle"));
						article.setrPass(rs.getString("rPass"));
						article.setrDate(rs.getTimestamp("rDate"));
						article.setrReadCount(rs.getInt("rReadcount"));
						article.setrRef(rs.getInt("rRef"));
						article.setrStep(rs.getInt("rStep"));
						article.setrDepth(rs.getInt("rDepth"));
						article.setrContents(rs.getString("rContents"));
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
	 public int updateArticle(Board_ReviewVO vo) {
		   Connection con = null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   String dbpasswd="";	
		   String sql1="";
		   String sql2="";
			int result=-1;
		 try {
			   con=DBcon.getConnection();
			   sql1="select fPass from ACI_BOARD_REVIEW where rNum=?";
			   pstmt = con.prepareStatement(sql1);
			   pstmt.setInt(1,vo.getrNum());
			   rs= pstmt.executeQuery();
			   if(rs.next()) {
				   dbpasswd=rs.getString("rPass");
				   if(dbpasswd.equals(vo.getrPass())) {
					   sql2="update ACI_BOARD_REVIEW set rWriter=?, rTitle=?, rContents=? where rNum=? ";
					   pstmt= con.prepareStatement(sql2);
					   
					   pstmt.setString(1,vo.getrWriter());
					   pstmt.setString(2,vo.getrTitle());
					   pstmt.setString(3,vo.getrContents());
					   pstmt.setInt(4,vo.getrNum());
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
			   sql1="select rPass from ACI_BOARD_REVIEW where rNum=?";
			   pstmt = con.prepareStatement(sql1);
			   pstmt.setInt(1,num);
			   rs= pstmt.executeQuery();
			   
			   if(rs.next()) {
				   dbpasswd=rs.getString("rPass");
				   if(dbpasswd.equals(pass)) {
					   sql2="delete from ACI_BOARD_REVIEW where rNum=?";
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
			String sql="select count(*) from ACI_BOARD_REVIEW where "+what+" like '%"+content+"%'";
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
  
  public List<Board_ReviewVO> getAllBoardList(){//all_board에 3개 넣는 메소드
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<Board_ReviewVO> allboardList=null;
		
		try {
			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement("select * from ACI_BOARD_REVIEW order by rNum desc LIMIT 3");
			
			
	        
			rs=pstmt.executeQuery();
			if(rs.next()) {
				allboardList = new ArrayList<Board_ReviewVO>();
				do {
					Board_ReviewVO vo = new Board_ReviewVO();
					vo.setrNum(rs.getInt("rNum"));
					vo.setrTitle(rs.getString("rTitle"));
					vo.setrDate(rs.getTimestamp("rDate"));
					
		
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
