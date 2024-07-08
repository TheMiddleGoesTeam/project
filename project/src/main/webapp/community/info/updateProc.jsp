<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="article" class="com.vo.BoardVO" scope="page">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	String pageNum = request.getParameter("pageNum");
	BoardDAO dbPro = BoardDAO.getInstance();
	
	int check = dbPro.updateArticle(article);
	
	if(check==1) {
		  response.sendRedirect("list.jsp");
		
%>

<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%}else { %>
<script type="text/javascript">
alert("비밀번호가 틀렸습니다.");
history.go(-1); //이전페이지로 이동
</script>
<%} %>
</body>
</html>