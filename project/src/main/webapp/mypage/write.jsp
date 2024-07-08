<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<%@ page import="com.vo.*" %>
<%@ page import="com.dao.MemberDAO" %>
<jsp:setProperty property = "*" name="vo"/>

<%@ include file="/include/document.jsp" %>

<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mypage.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/regscript.js"></script>

</head>

<body>
	<%@ include file="/include/header.jsp" %>
	<%
		MemberVO vo = dao.getMember(loginID);
	%>
	<section class="titles">
		<div class="inner">
			<div class="title_main">마이페이지<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath()%>/index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath()%>/mypage/info.jsp">my page</a>
			</div>
		</div>
	</section>
	<section id="mypage" class="section write">
		<div class="menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/mypage/product.jsp" class="button is-medium is-rounded">좋아하는 상품</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/review.jsp" class="button is-medium is-rounded">리뷰한 상품</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/write.jsp" class="button is-medium is-rounded is-success">내 글 목록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/comment.jsp" class="button is-medium is-rounded">내 댓글 목록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/info.jsp" class="button is-medium is-rounded">내 정보 수정</a></li>
				<li><a href="<%=request.getContextPath()%>/common/deleteForm.jsp" class="button is-medium is-rounded">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="inner">
				<form action="infoProc.jsp" method="post" name="myInfo">
					<h4 class="title is-4">작성한 글 목록</h4>
					<table class="table is-bordered is-striped is-fullwidth">
						<colgroup>
							<col width="60">
							<col width="">
							<col width="150">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tr>
							<td>3</td>
							<td><a href="#">제목입니다.</a></td>
							<td>24.06.28</td>
							<td><button type="button" class="button is-small is-danger">삭제하기</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="#">제목입니다.</a></td>
							<td>24.06.28</td>
							<td><button type="button" class="button is-small is-danger">삭제하기</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="#">제목입니다.</a></td>
							<td>24.06.28</td>
							<td><button type="button" class="button is-small is-danger">삭제하기</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>