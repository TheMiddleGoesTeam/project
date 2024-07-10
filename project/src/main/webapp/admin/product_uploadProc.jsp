<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%@ page import="com.dao.ProductDAO" %>
 <jsp:useBean id="vo" class="com.vo.ProductVO" />
 <%@ page import="java.sql.*" %>
 <% request.setCharacterEncoding("utf-8"); %>

<jsp:setProperty property = "*" name="vo"/>
<%
	ProductDAO gdao = ProductDAO.getInstance();
	gdao.productInsert(vo);
	response.sendRedirect("product.jsp");

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