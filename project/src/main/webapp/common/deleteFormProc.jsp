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

	<% 
	if(check == 1){
		session.invalidate();
	%>

	<section class="section">
		<div class="container">
			<table class="table">
				<tr>
					<td colspan="3" align="center">
						<%= loginID %>님의 회원 탈퇴 처리가 완료되었습니다.
					</td>
				</tr>
				<tr>
					<td width="100" align="center">
						<a href="<%=request.getContextPath() %>/index.jsp" class="button is-link">메인화면</a>
					</td>
					<td width="100" align="center">
						<a href="<%=request.getContextPath() %>/common/signup.jsp" class="button">회원가입</a>
					</td>
				</tr>
		</div>
	</section>
	<% }else { %>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
	<% } %>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>