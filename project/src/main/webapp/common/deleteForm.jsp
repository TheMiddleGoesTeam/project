<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/document.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/common.css">
</head>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/regscript.js"></script>

<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">
				회원탈퇴<i></i>
			</div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span> <a
					href="#">quit account</a>
			</div>
		</div>
	</section>
	<section id="signup" class="section">
		<div class="container">
			<form action="deleteFormProc.jsp" method="post" class="is-fullwidth" name="deleteUser" onsubmit="return checkIt()">
				<table class="table is-fullwidth">
					<tr>
						<th>아이디</th>
						<td><p name="mID" class="input"><%=loginID %></p></td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="mPass"
							class="input"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div class="field is-grouped">
								<p class="control">
									<input type="submit" value="회원탈퇴" onclick="inputCheck()"
										class="button is-danger">
								</p>
								<p class="control">
									<input type="button" value="취소" onclick="javascript:window.location='<%=request.getContextPath() %>/common/login.jsp'" class="button is-light">
								</p>
							</div>
						</td>
					</tr>
				</table>
			</form>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>