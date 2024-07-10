<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/document.jsp" %>
    
    <%
   
	int mNum = Integer.parseInt(request.getParameter("mNum"));
	String removeID = request.getParameter("mID");
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="section">
		<div class="container">
			<div class="inner box" style="width: 500px; text-align: center; margin: 50px auto;">
				<h4 class="title is-4"><%=mNum %>번 <%=removeID %>회원님을 삭제하시겠습니까?</h4>
				<div class="buttons is-fullwidth" style="justify-content: center;">
					<a href="removeformproxy.jsp?mNum=<%=mNum %>&&mID=<%=removeID%>" class="button is-dark is-fullwidth">삭제</a>
					<a href="#" class="button is-light is-fullwidth">취소</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>