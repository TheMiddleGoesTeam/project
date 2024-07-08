<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="com.*" %>    
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<jsp:useBean id="vo" class="com.vo.MemberVO" />
    
    
    <%
   
	int mNum = Integer.parseInt(request.getParameter("mNum"));
	String removeID = request.getParameter("mID");
    
	dao.remove(mNum);
    %>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=mNum %>번  <%=removeID %>회원님이 삭제되었습니다




</body>
</html>