package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.connection.DBcon;
import com.vo.BoardVO;


public class BoardDAO {
	private static BoardDAO instance = null;
	
	public static BoardDAO getInstance() {
		if(instance==null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	public void insertArticle(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		
		int num = vo.getbNum();
		int ref= vo.getbRef();
		int step= vo.getbStep();
		int depth = vo.getbDepth();
		int number=0;
		String sql1="select max(bNum) from ACI_BOARD";
		String sql2="update ACI_BOARD set bStep=bStep+1 where bRef=? and bStep > ?";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
		
			
			if(rs.next()) number = rs.getInt(1)+1;
			else number =1;
			
			if(num != 0) {//답변글 일 경우
				pstmt= conn.prepareStatement(sql2);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				
				pstmt.executeUpdate();
				step = step+1;
				depth=depth+1;
			}else {//새글일 경우
				ref = number;
				step = 0;
				depth=0;
			}
			String sql3="insert into ACI_BOARD(bTitle, bWriter, bPass, bRef, bStep, bDepth, bContents)"
					+ "values(?,?,?,?,?,?,?)";

			pstmt=conn.prepareStatement(sql3);
			
			
			pstmt.setString(1, vo.getbTitle());
			pstmt.setString(2,vo.getbWriter());
			pstmt.setString(3, vo.getbPass());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, step);
			pstmt.setInt(6, depth);
			pstmt.setString(7,vo.getbContents());

			
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
			String sql="select count(*) from ACI_BOARD";
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
	
	
	public List<BoardVO> getArticles(int start,int end){
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<BoardVO> articleList=null;
		
		try {
			conn= DBcon.getConnection();
			String sql="select * from (select rownum rnum, bNum, bTitle, bWriter, bPass, bCat, bDate, bReadcount, bRef, bStep, bDepth, bContents "
					+ "from (select * from ACI_BOARD order by bRef desc, step asc)) where rnum >=? and rnum <= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				articleList = new ArrayList<BoardVO>();
				do {
					BoardVO vo = new BoardVO();
					vo.setbNum(rs.getInt("bNum"));
					vo.setbTitle(rs.getString("bTitle"));
					vo.setbWriter(rs.getString("bWriter"));
					vo.setbPass(rs.getString("bPass"));
					vo.setbCat(rs.getString("bCat"));
					vo.setbDate(rs.getTimestamp("bDate"));
					vo.setbReadCount(rs.getInt("bReadcount"));
					vo.setbRef(rs.getInt("bRef"));
					vo.setbStep(rs.getInt("bStep"));
					vo.setbDepth(rs.getInt("bDepth"));
					vo.setbContents(rs.getString("bContents"));
		
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
	
	public BoardVO getArticle(int num) {
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardVO article =null;
		try {
			con=DBcon.getConnection();
			String sql1 = "update ACI_BOARD set bReadcount = bReadcount+1 where bNum=?";//조회수 증가
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql2="select * from ACI_BOARD where bNum=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();	
			
			if(rs.next()) {
				article = new BoardVO();
				article.setbNum(rs.getInt("bNum"));
				article.setbWriter(rs.getString("bWriter"));
				article.setbTitle(rs.getString("bTitle"));
				article.setbPass(rs.getString("bPass"));
				article.setbDate(rs.getTimestamp("bDate"));
				article.setbReadCount(rs.getInt("bReadcount"));
				article.setbRef(rs.getInt("bRef"));
				article.setbStep(rs.getInt("bStep"));
				article.setbDepth(rs.getInt("bDepth"));
				article.setbContents(rs.getString("bContents"));
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
	
 public BoardVO updateGetArticle(int num) {
		   Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			BoardVO article =null;
			 try {
					con=DBcon.getConnection();
					String sql="select * from ACI_BOARD where bNum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,num);
					rs=pstmt.executeQuery();	
					
					if(rs.next()) {
						article = new BoardVO();
						article.setbNum(rs.getInt("bNum"));
						article.setbWriter(rs.getString("bWriter"));
						article.setbTitle(rs.getString("bTitle"));
						article.setbPass(rs.getString("bPass"));
						article.setbDate(rs.getTimestamp("bDate"));
						article.setbReadCount(rs.getInt("bReadcount"));
						article.setbRef(rs.getInt("bRef"));
						article.setbStep(rs.getInt("bStep"));
						article.setbDepth(rs.getInt("bDepth"));
						article.setbContents(rs.getString("bContents"));
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
	 public int updateArticle(BoardVO vo) {
		   Connection con = null;
		   PreparedStatement pstmt=null;
		   ResultSet rs=null;
		   String dbpasswd="";	
		   String sql1="";
		   String sql2="";
			int result=-1;
		 try {
			   con=DBcon.getConnection();
			   sql1="select bPass from ACI_BOARD where bNum=?";
			   pstmt = con.prepareStatement(sql1);
			   pstmt.setInt(1,vo.getbNum());
			   rs= pstmt.executeQuery();
			   if(rs.next()) {
				   dbpasswd=rs.getString("bPass");
				   if(dbpasswd.equals(vo.getbPass())) {
					   sql2="update ACI_BOARD set bWriter=?, bTitle=?, bContents =? where bNum=? ";
					   pstmt= con.prepareStatement(sql2);
					   
					   pstmt.setString(1,vo.getbWriter());
					   pstmt.setString(2,vo.getbTitle());
					   pstmt.setString(3,vo.getbContents());
					   pstmt.setInt(4,vo.getbNum());
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
			   sql1="select bPass from ACI_BOARD where bNum=?";
			   pstmt = con.prepareStatement(sql1);
			   pstmt.setInt(1,num);
			   rs= pstmt.executeQuery();
			   
			   if(rs.next()) {
				   dbpasswd=rs.getString("bPass");
				   if(dbpasswd.equals(pass)) {
					   sql2="delete from ACI_BOARD where bNum=?";
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
			//String sql="select count(*) from board";
			String sql="select count(*) from ACI_BOARD where "+what+" like '%"+content+"%'";
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

	/*
	* 검색한 내용을 리스트로 받아옴(조건,내용,시작번호,끝번호)
	*/
  
	public List<BoardVO> getArticles(String what, String content,int start,int end){
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<BoardVO> articleList=null;
		
		try {
			con= DBcon.getConnection();
	
			String sql="select * from (select rownum rnum, bNum, bWriter, bTitle , bPass, bDate, bReadcount, bRef, bStep, bDepth, bContents "
					+ "from (select * from ACI_BOARD where "
					+what+" like '%"+content+"%' order by bRef desc, step asc)) where rnum >=? and rnum <= ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList<BoardVO>(5);
				do {
					BoardVO article = new BoardVO();
					article.setbNum(rs.getInt("bNum"));
					article.setbWriter(rs.getString("bWriter"));
					article.setbTitle(rs.getString("bTitle"));
					article.setbPass(rs.getString("bPass"));
					article.setbDate(rs.getTimestamp("bDate"));
					article.setbReadCount(rs.getInt("bReadcount"));
					article.setbRef(rs.getInt("bRef"));
					article.setbStep(rs.getInt("bStep"));
					article.setbDepth(rs.getInt("bDepth"));
					article.setbContents(rs.getString("bContents"));
					
					articleList.add(article);
				}while(rs.next());
			}
			
		}catch (SQLException s) {
			s.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
			if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
		}
		return articleList;
	}//end getArticles
  
  
	public List<BoardVO> getAllBoardList(){//all_board에 3개 넣는 메소드
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<BoardVO> allboardList=null;
		
		try {
			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement("select * from ACI_BOARD order by bNum desc LIMIT 3");
			
			
	        
			rs=pstmt.executeQuery();
			if(rs.next()) {
				allboardList = new ArrayList<BoardVO>();
				do {
					BoardVO vo = new BoardVO();
					vo.setbNum(rs.getInt("bNum"));
					vo.setbTitle(rs.getString("bTitle"));
					vo.setbDate(rs.getTimestamp("bDate"));
					
		
					allboardList.add(vo);
				}while(rs.next());
			}
			
		 }catch (SQLException s) {
			s.printStackTrace();
		 }finally{
	    	//conn.close(rs, pstmt, conn);
					if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
					if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
					if(conn != null)try{conn.close();}catch(SQLException s){s.printStackTrace();}
		 }
		return allboardList;
	}//end 
}
