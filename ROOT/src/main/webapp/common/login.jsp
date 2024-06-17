<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String loginID = (String)session.getAttribute("loginID");
%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">로그인<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath() %>/index.html" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">login</a>
			</div>
		</div>
	</section>
	<section id="login" class="section">
	<%
		if (loginID != null) { // 로그인 성공
	%>
		<div class="container">
			<table class="table">
				<tr>
					<td colspan="3" align="center">
						<%= loginID %>님 환영합니다
					</td>
				</tr>
				<tr>
					<td width="100" align="center">
						<a href="modifyForm.jsp" class="button is-link">회원정보수정</a>
					</td>
					<td width="100" align="center">
						<a href="deleteForm.jsp" class="button is-danger">회원탈퇴</a>
					</td>
					<td width="100" align="center">
						<a href="logout.jsp" class="button">로그아웃</a>
					</td>
				</tr>
			</table>
		</div>
	</section>
	
	<% } else { // 로그인 실패 %>
	<form action="loginProc.jsp" method="post">
		<div class="container">
			<div class="in">
				<div class="inputs">
					<input type="text" name="id" size="20" class="id input" placeholder="아이디를 입력하세요.">
					<input type="password" name="pass" size="20" class="pw input" placeholder="비밀번호를 입력하세요.">
				</div>
				<input type="submit" value="로그인" class="button is-fullwidth is-success has-text-white">
				<input type="button" value="회원가입" onclick="javascript:window.location='regForm.jsp'" class="button is-fullwidth is-light">
			</div>
		</div>
	</form>
	<% } %>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>