<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/page.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
    
 <%
 	session.invalidate();
 %>
    
    
<!DOCTYPE html>
<html>
<head>
<%-- <meta charset="UTF-8" http-equiv="refresh" content="0;url=login.jsp"> --%>
<title>로그아웃</title>
</head>
<body>
	<section class="section">
		<div class="container">
			<form action="center">
				<div class="box" style="width: 500px; text-align: center; margin: 50px auto;">
					<h4 class="subtitle is-4">성공적으로 로그아웃했습니다.</h4>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>