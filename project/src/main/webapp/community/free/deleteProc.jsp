<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.Board_FreeDAO" %>
<%@ page import="java.sql.Timestamp" %>
 
<% request.setCharacterEncoding("utf-8"); %>
<%
int fNum = Integer.parseInt(request.getParameter("fNum"));
String pageNum = request.getParameter("pageNum");
String fPass = request.getParameter("fPass");
 
Board_FreeDAO dbPro = Board_FreeDAO.getInstance();

int check = dbPro.deleteArticle(fNum, fPass);

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