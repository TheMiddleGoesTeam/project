<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<jsp:useBean id="vo" class="com.vo.MemberVO" />
<jsp:setProperty property = "*" name="vo"/>
<%
	boolean flag = dao.memberInsert(vo);
%>
<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="section">
		<div class="container">
			<div class="inner box" style="width: 500px; text-align: center; margin: 50px auto;">
				<%
					if (flag) {
						out.println("<h4 class='title is-4'>회원이 된 것을 축하합니다!</h4>");
						out.println("<a href='login.jsp' class='button is-link is-fullwidth'>로그인</a>");
					} else {
						out.println("<h4 class='subtitle is-4'>다시 작성하세요.</h4>");
						out.println("<a href='signup.jsp' class='button is-light is-fullwidth'>다시작성</a>");
					}
				%>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>