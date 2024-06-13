package com.connection;

import java.sql.*;

import javax.sql.*;
 
public class DBcon {
    String driver = "org.mariadb.jdbc.Driver";
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
 
    private static DataSource ds;
    
    public DBcon() {
         try {
            Class.forName(driver);
            con = DriverManager.getConnection(
                    "jdbc:mariadb://183.111.242.22:3306/themgt",
                    "themgt",
                    "Themiddle1");
            
            if( con != null ) {
                System.out.println("DB 접속 성공");
            }
            
        } catch (ClassNotFoundException e) { 
            System.out.println("드라이버 로드 실패");
        } catch (SQLException e) {
            System.out.println("DB 접속 실패");
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args){
        DBcon dbcon = new DBcon();
    }
    
    public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
    
    
}
