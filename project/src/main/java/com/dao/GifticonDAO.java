package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.connection.DBcon;
import com.vo.GifticonVO;

public class GifticonDAO {
	
	
	private static GifticonDAO instance = null;
	private GifticonDAO(){	}
	
	
	
	public static GifticonDAO getInstance() {
		if(instance==null) {
			synchronized (GifticonDAO.class) {
				instance = new GifticonDAO();
			}
		}
		return instance;
	}
	
	
	

	public void gifticonInsert(GifticonVO vo) {
		
		Connection con = null;
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
 		
		int giftPrice = vo.getGiftPrice();
		System.out.println(vo.getGiftPrice());
		
		try {
			con = DBcon.getConnection();
			String sql = 
				"insert into ACI_GIFTICON(giftcode,giftName,giftBrand,giftCat,giftPrice,giftComment,giftImage) "
				+ "values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, vo.getGiftCode());
			pstmt.setString(2, vo.getGiftName());
			pstmt.setString(3, vo.getGiftBrand());
			pstmt.setString(4, vo.getGiftCat());
			pstmt.setInt(5, giftPrice);
			pstmt.setString(6, vo.getGiftComment());
			pstmt.setString(7, vo.getGiftImage());
		
		
			
			
			pstmt.executeUpdate();
			
		
		} catch (SQLException ss) {
			ss.printStackTrace();
			
		} finally {
			DBcon.close(rs, pstmt, con);
		}
	}	
	
	
	
	public List<GifticonVO> getgifticon(){
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = "select * from ACI_GIFTICON order by giftCode asc";
		
		List<GifticonVO> getgiftList=null;
		
		try {

			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				getgiftList = new ArrayList<GifticonVO>();
					do {
						GifticonVO gvo = new GifticonVO();
						gvo.setGiftCode(rs.getString("giftCode"));
						gvo.setGiftName(rs.getString("giftName"));
						gvo.setGiftBrand(rs.getString("giftBrand"));
						gvo.setGiftDate(rs.getTimestamp("giftDate"));
						gvo.setGiftPrice(rs.getInt("giftPrice"));
						gvo.setGiftComment(rs.getString("giftComment"));
						gvo.setGiftImage(rs.getString("giftImage"));
						gvo.setGiftCat(rs.getString("giftCat"));
						
						getgiftList.add(gvo);
					}while(rs.next());
				}
			
			
			}catch (SQLException s) {
				s.printStackTrace();
			}finally{
				DBcon.close(rs, pstmt, conn);
			}
			return getgiftList;
		}
	
	
	
public GifticonVO getgifticonCode(String giftCode){
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		GifticonVO gvo =null;
		
		String sql = "select * from ACI_GIFTICON where giftCode =?";
		
		try {

			conn= DBcon.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, giftCode);
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
						gvo = new GifticonVO();
						gvo.setGiftCode(rs.getString("giftCode"));
						gvo.setGiftName(rs.getString("giftName"));
						gvo.setGiftBrand(rs.getString("giftBrand"));
						gvo.setGiftDate(rs.getTimestamp("giftDate"));
						gvo.setGiftPrice(rs.getInt("giftPrice"));
						gvo.setGiftComment(rs.getString("giftComment"));
						gvo.setGiftImage(rs.getString("giftImage"));
						gvo.setGiftCat(rs.getString("giftCat"));
						
				}
			
			
			}catch (SQLException s) {
				s.printStackTrace();
			}finally{
				DBcon.close(rs, pstmt, conn);
			}
			return gvo;
		}
	
	
	public void deleteGifticon(String giftCode) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="delete from ACI_GIFTICON where GIFTCODE=?";
		
		try {
			
			con=DBcon.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, giftCode);
			
			pstmt.executeUpdate();
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			DBcon.close(rs, pstmt, con);
		}
		
		
		
		
		
		
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
}
