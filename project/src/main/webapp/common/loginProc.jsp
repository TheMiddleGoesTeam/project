<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
    
<%
		String mID = request.getParameter("mID"); //로그인폼에서 아이디와 패스워드 넘겨줌
		String mPass = request.getParameter("mPass");
		
		int check = dao.loginCheck(mID, mPass);//비교


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(check ==1) {//로그인 성공
	session.setAttribute("loginID", mID); //로그인
	response.sendRedirect("login.jsp"); //로그인 성공시 페이지 이동
}else if(check ==0) {// 아이디는 존재하는데 비밀번호가 틀리다(오류)
%>
<script type="text/javascript">
alert("비밀번호가 틀렸습니다.");
history.go(-1); //이전페이지로 이동
</script>

<%} else {// -1 %>
<script type="text/javascript">
alert("아이디가 존재하지 않습니다.");
history.go(-1); //이전페이지로 이동
</script>
<%} %>

</body>
</html>