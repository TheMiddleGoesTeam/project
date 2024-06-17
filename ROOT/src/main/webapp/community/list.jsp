<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">자유 게시판<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">community</a>
			</div>
		</div>
	</section>
	<section class="section community list">
		<div class="container">
			<table class="table is-fullwidth">
				<colgroup>
					<col width="100">
					<col width="">
					<col width="200">
					<col width="100">
					<col width="100">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tr>
					<td colspan="5" class="none">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
			<div class="buttons is-right">
				<a href="writeForm.jsp" class="button is-success write">글쓰기</a>
			</div>

			<div class="paging filed">
				<div class="buttons has-addons is-centered">
					<a href="#" class="button is-white">1</a>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>