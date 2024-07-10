<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.*" %>
<%@ include file="/include/document.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<jsp:useBean id="vo" class="com.vo.MemberVO" >
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
    
    <%
    String loginID = (String)session.getAttribute("loginID");
    vo.setmID(loginID);
    dao.updateMember(vo);
    %>
<meta charset="UTF-8" http-equiv="refresh" content="3;url=<%=request.getContextPath() %>/common/login.jsp">
<title>회원정보수정</title>
</head>
<body>
	<section class="section">
		<div class="container">
			<div class="inner box" style="text-align: center; width: 500px; margin: 50px auto;">
				<h4 class="title is-4">입력하신 내용대로 회원정보가 수정되었습니다.</h4>
				<h4 class="subtitle is-4">3초 후에 Login Page로 이동합니다.</h4>
			</div>
		</div>
	</section>
</body>
</html>