<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>
 
<% request.setCharacterEncoding("utf-8"); %>
<%
int bNum = Integer.parseInt(request.getParameter("bNum"));
String pageNum = request.getParameter("pageNum");
String bPass = request.getParameter("bPass");
 
BoardDAO dbPro = BoardDAO.getInstance();

int check = dbPro.deleteArticle(bNum, bPass);

if(check == 1){
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<title>Insert title here</title>
</head>
<body>
<%}else{ %>
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다.")
	history.go(-1);
</script>
<%} %>
</body>
</html>