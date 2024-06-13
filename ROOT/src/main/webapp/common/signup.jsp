<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">회원가입<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">sign up</a>
			</div>
		</div>
	</section>
	<section id="signup" class="section">
		<div class="container">
			<form action="signupProc.jsp" method="post" class="is-fullwidth">
				<table class="table is-fullwidth">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" class="input is-inline">
							<input type="button" value="중복확인" onclick="idCheck(this.form.id.value)" class="button is-success is-light">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pass" class="input is-inline"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="repass" class="input is-inline"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" class="input is-inline"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="select">
								<select name="phone1" >
									<option value="02">02</option>
									<option value="063">063</option>
									<option value="033">033</option>
									<option value="070">070</option>
									<option value="010">010</option>
								</select>
							</div>
							<input type="text" name="phone2" size="5" class="input is-inline">
							<input type="text" name="phone3" size="5" class="input is-inline">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" class="input is-inline"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="field is-grouped">
								<p class="control">
									<input type="button" value="회원가입" onclick="inputCheck()" class="button is-success has-text-white">
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