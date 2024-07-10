<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <%@ page import="com.vo.GifticonVO" %>
<%@ page import="com.dao.GifticonDAO" %>
    
    
 
<%
	GifticonDAO giftdao = GifticonDAO.getInstance();
	
	String giftcode = (String)request.getParameter("giftcode");
	giftdao.deleteGifticon(giftcode);
   
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