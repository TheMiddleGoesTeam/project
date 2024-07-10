package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.connection.DBcon;
import com.vo.ProductVO;
import com.vo.GifticonVO;
import com.vo.MemberVO;
import com.connection.DBcon;


public class ProductDAO {
	
	
	private static ProductDAO instance = null;
	private ProductDAO(){	}
	
	
	
	public static ProductDAO getInstance() {
		if(instance==null) {
			synchronized (ProductDAO.class) {
				instance = new ProductDAO();
			}
		}
		return instance;
	}
	
	
	

	public void productInsert(ProductVO vo) {
		
		Connection con = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
 		
		
		try {
			con = DBcon.getConnection();
			String sql = 
				"insert into ACI_PRODUCT(pCode,pName,pBrand,pCat,pDate,pComment,plike,ptag,pImg,pURL) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getpCode());
			pstmt.setString(2, vo.getpName());
			pstmt.setString(3, vo.getpBrand());
			pstmt.setString(4, vo.getpCat());
			pstmt.setString(5, vo.getpComment());
			pstmt.setInt(6, vo.getPlike());
			pstmt.setString(7, vo.getPtag());
			pstmt.setString(8, vo.getpImg());
			pstmt.setString(9, vo.getpURL());
			
		
		
			
			
			pstmt.executeUpdate();
			
		
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
			DBcon.close(rs, pstmt, con);
		}
	}	
	
	
	
	public List<ProductVO> getproduct(){
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "select * from ACI_PRODUCT order by pCode asc";
		
		List<ProductVO> getproductList=null;
		
		try {

			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				getproductList = new ArrayList<ProductVO>();
					do {
						ProductVO pvo = new ProductVO();
						pvo.setpCode(rs.getString("pCode"));
						pvo.setpName(rs.getString("pName"));
						pvo.setpBrand(rs.getString("pBrand"));
						pvo.setpCat(rs.getString("pCat"));
						pvo.setpDate(rs.getTimestamp("pDate"));
						pvo.setpComment(rs.getString("pComment"));
						pvo.setPlike(rs.getInt("Plike"));
						pvo.setpImg(rs.getString("pImg"));
						pvo.setpURL(rs.getString("pURL"));
						
						getproductList.add(pvo);
					}while(rs.next());
				}
			
			
			}catch (SQLException s) {
				s.printStackTrace();
			}finally{
				DBcon.close(rs, pstmt, conn);
			}
			return getproductList;
		}
	
	
	public ProductVO getproductCode(int pCode){
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ProductVO pvo =null;
		
		String sql = "select * from ACI_PRODUCT where pCode =?";
		
		try {

			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pCode);
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
						pvo = new ProductVO();
						pvo.setpCode(rs.getString("pCode"));
						pvo.setpName(rs.getString("pName"));
						pvo.setpBrand(rs.getString("pBrand"));
						pvo.setpCat(rs.getString("pCat"));
						pvo.setpDate(rs.getTimestamp("pDate"));
						pvo.setpComment(rs.getString("pComment"));
						pvo.setPlike(rs.getInt("pLike"));
						pvo.setPtag(rs.getString("pTag"));
						pvo.setpURL(rs.getString("pURL"));
						pvo.setpImg(rs.getString("pIMG"));
						
						
				}
			
			
			}catch (SQLException s) {
				s.printStackTrace();
			}finally{
				DBcon.close(rs, pstmt, conn);
			}
			return pvo;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
