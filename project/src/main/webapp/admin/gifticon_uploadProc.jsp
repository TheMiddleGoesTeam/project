<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%@ page import="com.dao.GifticonDAO" %>
 <jsp:useBean id="vo" class="com.vo.GifticonVO" />
 <%@ page import="java.sql.*" %>
 <% request.setCharacterEncoding("utf-8"); %>

<jsp:setProperty property = "*" name="vo"/>
<%
	GifticonDAO gdao = GifticonDAO.getInstance();
	gdao.gifticonInsert(vo);
	response.sendRedirect("gifticon.jsp");

%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>