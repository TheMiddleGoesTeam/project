package com.connection;

import java.sql.*;

<<<<<<< HEAD
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBcon {
	private static DataSource ds;
	
	static {
		try {
			Context initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/themgt");
		} catch(NamingException ne) {
			ne.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	

	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt != null) {
			try {
				if(!stmt.isClosed())
					stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		
		if(conn !=null) {
			try {
				if(!conn.isClosed())
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
		
		
	}

	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		
		if(rs != null) {
			try {
				if(!rs.isClosed())
					rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				rs=null;
			}
		}
		
			
		if(stmt != null) {
			try {
				if(!stmt.isClosed())
					stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		
		if(conn !=null) {
			try {
				if(!conn.isClosed())
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}

	}
=======
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
                System.out.println("DB 연결 성공");
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
    
>>>>>>> refs/remotes/origin/main
    
}
