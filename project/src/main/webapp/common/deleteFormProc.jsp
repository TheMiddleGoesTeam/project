<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.*" %>    
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<jsp:useBean id="vo" class="com.vo.MemberVO" />

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<%
String id = (String)session.getAttribute("loginID");
String pass = request.getParameter("mPass");

int check = dao.deleteMember(id, pass);

%>
<body>
<%@ include file="/include/header.jsp" %>

	<section class="section">
		<div class="container">
			<div class="box" style="text-align: center; width: 500px; margin: 50px auto;">
	<% 
	if(check == 1){
		session.invalidate();
	%>
		<h4 class="title is-4"><%= loginID %>님의 회원 탈퇴 처리가 완료되었습니다.</h4>

		<div class="buttons is-center" style="justify-content: center;">
			<a href="<%=request.getContextPath() %>/index.jsp" class="button is-light">메인화면</a>
			<a href="<%=request.getContextPath() %>/common/signup.jsp" class="button is-success">회원가입</a>
		</div>
	<% }else { %>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
	<% } %>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>