<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.dao.GifticonDAO" %>
    <%@ page import="com.vo.GifticonVO" %>
    
    
    <%

// 기존에 생성된 장바구니를 얻어옴, 없으면 새로 생성
 List<GifticonVO> cart = (List<GifticonVO>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

// URL 매개변수로부터 기프티콘 이름과 가격을 읽어옴
String giftCode = (String)request.getParameter("gcode");

GifticonDAO giftPro = GifticonDAO.getInstance();
GifticonVO giftvo = giftPro.getgifticonCode(giftCode);

cart.add(giftvo);


%>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
response.sendRedirect("buy.jsp");  
%>

</body>
</html>