<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dao" class="com.dao.MemberDAO" />
    
  <%
  	String mID = request.getParameter("mID");
  	boolean check = dao.idCheck(mID);
  
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
<link href = "style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/regscript.js"></script>

</head>
<body bgcolor="#FFFFCC">
<br>
<div align="center">
<b><%=mID %></b>
<%
if(check){// true 일 경우는 아이디가 존재할경우 
	out.println("는 이미 존재하는 아이디입니다. <br>");
}else{
	out.println("사용 가능한 아이디입니다.<br>");
}

%>
<a href ="#" onclick="javascript:self.close()">닫기</a>

</div>

</body>
</html>