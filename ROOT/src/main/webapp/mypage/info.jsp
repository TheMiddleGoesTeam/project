<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<jsp:useBean id="vo" class="com.vo.MemberVO" />
<jsp:setProperty property = "*" name="vo"/>

<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mypage.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">내 정보 수정<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">mypage</a>
			</div>
		</div>
	</section>
	<section id="info" class="section mypage">
		<div class="menu">
			<ul>
				<li><a href="#" class="button is-medium is-rounded">좋아하는 상품</a></li>
				<li><a href="#" class="button is-medium is-rounded">리뷰한 상품</a></li>
				<li><a href="#" class="button is-medium is-rounded">내 글 목록</a></li>
				<li><a href="#" class="button is-medium is-rounded">내 댓글 목록</a></li>
				<li><a href="#" class="button is-medium is-rounded is-success">내 정보 수정</a></li>
			</ul>
		</div>
		<div class="container">
			<form action="mypageProc.jsp" method="post" name="myInfo">
				<table class="table is-fullwidth">
					<tr>
						<th>아이디</th>
						<td><%= vo.getmID()%></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" name="mNic" class="input is-inline" value="<%= vo.getmNic()%>"></td>
					</tr>
					<tr>
						<th>비밀번호 수정</th>
						<td>
							<input type="password" name="mPass" value="<%= vo.getmPass() %>" class="input is-inline">
						</td>
					</tr>
					<tr>
						<th>비밀번호 수정 확인</th>
						<td>
							<input type="password" name="repass" value="<%= vo.getmPass() %>" class="input is-inline">
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="mName" value="<%= vo.getmName() %>" class="input is-inline"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
<<<<<<< HEAD
							<input type="text" name="mtel1" size="4" value="" class="input is-inline">
							<input type="text" name="mtel2" size="5" value="" class="input is-inline">
							<input type="text" name="mtel3" size="5" value="" class="input is-inline">
=======
							<input type="text" name="mtel1" size="4" value="<%= vo.getmTel1() %>" class="input is-inline">
							<input type="text" name="mtel2" size="5" value="<%= vo.getmTel2() %>" class="input is-inline">
							<input type="text" name="mtel3" size="5" value="<%= vo.getmTel3() %>" class="input is-inline">
>>>>>>> refs/remotes/origin/main
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="mEmail" value="<%= vo.getmEmail() %>" class="input is-inline"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="field is-grouped">
								<p class="control">
									<input type="button" value="정보수정" onclick="inputCheck()" class="button is-success has-text-white">
								</p>
								<p class="control">
									<input type="reset" value="다시작성" class="button is-light">
								</p>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>