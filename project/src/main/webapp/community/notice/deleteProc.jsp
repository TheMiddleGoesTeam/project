<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.Board_NoticeDAO" %>
<%@ page import="java.sql.Timestamp" %>
 
<% request.setCharacterEncoding("utf-8"); %>
<%
int nNum = Integer.parseInt(request.getParameter("nNum"));
String pageNum = request.getParameter("pageNum");
String nPass = request.getParameter("nPass");
 
Board_NoticeDAO dbPro = Board_NoticeDAO.getInstance();

int check = dbPro.deleteArticle(nNum, nPass);

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