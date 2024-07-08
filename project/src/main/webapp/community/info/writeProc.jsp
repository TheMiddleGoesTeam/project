<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.dao.BoardDAO" %>
<%@ page import="com.dao.MileageDAO" %>
<%@ page import="java.sql.*" %>
 
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" class="com.vo.BoardVO" scope="page">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
	String loginID = (String)session.getAttribute("loginID");
	article.setbDate(new Timestamp(System.currentTimeMillis()));
   // article.setIp(request.getRemoteAddr());
    BoardDAO dbPro = BoardDAO.getInstance();
    
    MileageDAO miledao = new MileageDAO();
    
    //데이터베이스에서 글 추가하는 메소드 호출
    dbPro.insertArticle(article);
    miledao.mileagePlus(loginID);
    
    response.sendRedirect("list.jsp");    
%>