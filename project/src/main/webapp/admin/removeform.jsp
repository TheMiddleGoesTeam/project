<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/document.jsp" %>
    
    <%
   
	int mNum = Integer.parseInt(request.getParameter("mNum"));
	String removeID = request.getParameter("mID");
    
    %>
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=mNum %>번  <%=removeID %>회원님을 삭제하시겠습니까?
<a href="removeformproxy.jsp?mNum=<%=mNum %>&&mID=<%=removeID%>" >삭제</a>
<a href="#" >취소</a>

</body>
</html>