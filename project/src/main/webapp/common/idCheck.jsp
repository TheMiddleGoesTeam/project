<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dao" class="com.dao.MemberDAO" />
 <%@ include file="/include/document.jsp" %>
    
  <%
  	String mID = request.getParameter("mID");
  	boolean check = dao.idCheck(mID);
  
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/regscript.js"></script>

</head>
<body>
	<section class="section">
		<div class="container">
			<div class="inner box" style="width: 450px; height: 250px; text-align: center;">
				<div class="subtitle is-5">
					<h4 class="title is-4"><%=mID %></h4>
				<%
					if(check){// true 일 경우는 아이디가 존재할경우 
						out.println(" 는 이미 존재하는 아이디입니다.");
					}else{
						out.println(" 사용 가능한 아이디입니다.");
					}

				%>
				</div>
				<a href ="#" onclick="javascript:self.close()" class="button is-dark is-fullwidth">닫기</a>
			</div>
		</div>
	</section>
</body>
</html>