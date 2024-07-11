package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.connection.DBcon;
import com.vo.Board_FreeVO;


public class Board_FreeDAO {
    private static Board_FreeDAO instance = null;
    
    public static Board_FreeDAO getInstance() {
        if(instance==null) {
            synchronized (Board_FreeDAO.class) {
                instance = new Board_FreeDAO();
            }
        }
        return instance;
    }
    
    public void insertArticle(Board_FreeVO vo) {
        Connection conn = null;
        PreparedStatement pstmt =  null;
        ResultSet rs = null;
        
        int num = vo.getfNum();
        int ref= vo.getfRef();
        int step= vo.getfStep();
        int depth = vo.getfDepth();
        int number=0;
        String sql1="select max(fNum) from ACI_BOARD_FREE";
        String sql2="update ACI_BOARD_FREE set fStep=fStep+1 where fRef=? and fStep > ?";
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
            String sql3="insert into ACI_BOARD_FREE(fTitle, fWriter, fPass, fRef, fStep, fDepth, fContents)"
                    + "values(?,?,?,?,?,?,?)";

            pstmt=conn.prepareStatement(sql3);
            
            
            pstmt.setString(1, vo.getfTitle());
            pstmt.setString(2,vo.getfWriter());
            pstmt.setString(3, vo.getfPass());
            pstmt.setInt(4, ref);
            pstmt.setInt(5, step);
            pstmt.setInt(6, depth);
            pstmt.setString(7,vo.getfContents());
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
            String sql="select count(*) from ACI_BOARD_FREE";
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
    
    
    public List<Board_FreeVO> getArticles(int start,int end){
        Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        List<Board_FreeVO> articleList=null;
        
        try {
            conn= DBcon.getConnection();
            String sql="select * from ACI_BOARD_FREE order by fNum desc LIMIT ?, 10";
                    
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            
            rs=pstmt.executeQuery();

            if(rs.next()) {
                articleList = new ArrayList<Board_FreeVO>();
                do {
                    Board_FreeVO vo = new Board_FreeVO();
                    vo.setfNum(rs.getInt("fNum"));
                    vo.setfTitle(rs.getString("fTitle"));
                    vo.setfWriter(rs.getString("fWriter"));
                    vo.setfPass(rs.getString("fPass"));
                    vo.setfCat(rs.getString("fCat"));
                    vo.setfDate(rs.getTimestamp("fDate"));
                    vo.setfReadCount(rs.getInt("fReadcount"));
                    vo.setfRef(rs.getInt("fRef"));
                    vo.setfStep(rs.getInt("fStep"));
                    vo.setfDepth(rs.getInt("fDepth"));
                    vo.setfContents(rs.getString("fContents"));
        
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
    
    public Board_FreeVO getArticle(int num) {
        Connection con = null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        Board_FreeVO article =null;
        try {
            con=DBcon.getConnection();
            String sql1 = "update ACI_BOARD_FREE set fReadcount = fReadcount+1 where fNum=?";//조회수 증가
            pstmt = con.prepareStatement(sql1);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            
            String sql2="select * from ACI_BOARD_FREE where fNum=?";
            pstmt = con.prepareStatement(sql2);
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();    
            
            if(rs.next()) {
                article = new Board_FreeVO();
                article.setfNum(rs.getInt("fNum"));
                article.setfWriter(rs.getString("fWriter"));
                article.setfTitle(rs.getString("fTitle"));
                article.setfPass(rs.getString("fPass"));
                article.setfDate(rs.getTimestamp("fDate"));
                article.setfReadCount(rs.getInt("fReadcount"));
                article.setfRef(rs.getInt("fRef"));
                article.setfStep(rs.getInt("fStep"));
                article.setfDepth(rs.getInt("fDepth"));
                article.setfContents(rs.getString("fContents"));
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
    
 public Board_FreeVO updateGetArticle(int num) {
           Connection con = null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            Board_FreeVO article =null;
             try {
                    con=DBcon.getConnection();
                    String sql="select * from ACI_BOARD_FREE where fNum=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,num);
                    rs=pstmt.executeQuery();    
                    
                    if(rs.next()) {
                        article = new Board_FreeVO();
                        article.setfNum(rs.getInt("fNum"));
                        article.setfWriter(rs.getString("fWriter"));
                        article.setfTitle(rs.getString("fTitle"));
                        article.setfPass(rs.getString("fPass"));
                        article.setfDate(rs.getTimestamp("fDate"));
                        article.setfReadCount(rs.getInt("fReadcount"));
                        article.setfRef(rs.getInt("fRef"));
                        article.setfStep(rs.getInt("fStep"));
                        article.setfDepth(rs.getInt("fDepth"));
                        article.setfContents(rs.getString("fContents"));
                    }
               }catch (SQLException s) {
                    s.printStackTrace();
                }finally{
                    if(rs != null)try{rs.close();}catch(SQLException s){s.printStackTrace();}
                    if(pstmt != null)try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
                    if(con != null)try{con.close();}catch(SQLException s){s.printStackTrace();}
                }
                return article;
       }    //end
    
    
      /*
        * 데이터 베이스에 실제 글이 수정되어야함
        */
     public int updateArticle(Board_FreeVO vo) {
           Connection con = null;
           PreparedStatement pstmt=null;
           ResultSet rs=null;
           String dbpasswd="";  
           String sql1="";
           String sql2="";
            int result=-1;
         try {
               con=DBcon.getConnection();
               sql1="select fPass from ACI_BOARD_FREE where fNum=?";
               pstmt = con.prepareStatement(sql1);
               pstmt.setInt(1,vo.getfNum());
               rs= pstmt.executeQuery();
               if(rs.next()) {
                   dbpasswd=rs.getString("fPass");
                   if(dbpasswd.equals(vo.getfPass())) {
                       sql2="update ACI_BOARD_FREE set fWriter=?, fTitle=?, fContents =? where fNum=? ";
                       pstmt= con.prepareStatement(sql2);
                       
                       pstmt.setString(1,vo.getfWriter());
                       pstmt.setString(2,vo.getfTitle());
                       pstmt.setString(3,vo.getfContents());
                       pstmt.setInt(4,vo.getfNum());
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
               sql1="select fPass from ACI_BOARD_FREE where fNum=?";
               pstmt = con.prepareStatement(sql1);
               pstmt.setInt(1,num);
               rs= pstmt.executeQuery();
               
               if(rs.next()) {
                   dbpasswd=rs.getString("fPass");
                   if(dbpasswd.equals(pass)) {
                       sql2="delete from ACI_BOARD_FREE where fNum=?";
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
            String sql="select count(*) from ACI_BOARD_FREE where "+what+" like '%"+content+"%'";
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
  
    public List<Board_FreeVO> getArticles(String what, String content,int start,int end){
        Connection con = null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        

        List<Board_FreeVO> articleList=null;
        
        try {
            con= DBcon.getConnection();
    
            String sql="SELECT * FROM ACI_BOARD_FREE WHERE " + what + " LIKE ? "
                       + "ORDER BY fRef DESC, fStep ASC LIMIT ? OFFSET ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, "%" + content + "%");
            pstmt.setInt(2, end - start + 1);
            pstmt.setInt(3, start);
            rs=pstmt.executeQuery();
            if(rs.next()) {
                articleList = new ArrayList<Board_FreeVO>();
                do {
                    Board_FreeVO article = new Board_FreeVO();
                    article.setfNum(rs.getInt("fNum"));
                    article.setfWriter(rs.getString("fWriter"));
                    article.setfTitle(rs.getString("fTitle"));
                    article.setfPass(rs.getString("fPass"));
                    article.setfDate(rs.getTimestamp("fDate"));
                    article.setfReadCount(rs.getInt("fReadcount"));
                    article.setfRef(rs.getInt("fRef"));
                    article.setfStep(rs.getInt("fStep"));
                    article.setfDepth(rs.getInt("fDepth"));
                    article.setfContents(rs.getString("fContents"));
                    
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
  
  
    public List<Board_FreeVO> getAllBoardList(){//all_board에 3개 넣는 메소드
        Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        List<Board_FreeVO> allboardList=null;
        
        try {
            conn= DBcon.getConnection();
            pstmt=conn.prepareStatement("select * from ACI_BOARD_FREE order by fNum desc LIMIT 3");
            
            
            
            rs=pstmt.executeQuery();
            if(rs.next()) {
                allboardList = new ArrayList<Board_FreeVO>();
                do {
                    Board_FreeVO vo = new Board_FreeVO();
                    vo.setfNum(rs.getInt("fNum"));
                    vo.setfTitle(rs.getString("fTitle"));
                    vo.setfDate(rs.getTimestamp("fDate"));
                    
        
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
