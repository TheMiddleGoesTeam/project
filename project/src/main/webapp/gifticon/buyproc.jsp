<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="com.vo.GifticonVO" %>
<%@ page import="com.dao.OrderDAO" %>



<%
    String loginID = (String) session.getAttribute("loginID");
    List<GifticonVO> cart = (List<GifticonVO>) session.getAttribute("cart");

    OrderDAO orderDAO = new OrderDAO();

    for (GifticonVO item : cart) {
    	//orderDAO.insertOrder(loginID,item.getGiftCode(), item.getGiftPrice());
    	orderDAO.deductMileage(loginID, item.getGiftPrice());
    	
    }
    

    
    // 장바구니 초기화
    session.removeAttribute("cart");
    
    
    response.sendRedirect("orderComplete.jsp");
    
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