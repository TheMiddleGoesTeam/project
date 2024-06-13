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
                    "jdbc:mariadb://183.111.242.22:3306",
                    "themgt",
                    "Themiddle1");
            
            if( con != null ) {
                System.out.println("DB ���� ���� sucess?");
            }
            
        } catch (ClassNotFoundException e) { 
            System.out.println("����̹� �ε� ����");
        } catch (SQLException e) {
            System.out.println("DB ���� ����");
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
