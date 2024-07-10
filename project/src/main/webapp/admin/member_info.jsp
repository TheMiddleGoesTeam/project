<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">관리자 페이지<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath() %>/index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/admin/main.jsp">Admin</a>
			</div>
		</div>
	</section>
	<section id="admin" class="section info">
		<div class="container">
			<div class="menu">
				<div class="grid">
					<div class="cell brand"><a href="<%=request.getContextPath() %>/admin/brand.jsp" class="button is-medium is-fullwidth is-link is-light">브랜드 관리</a></div>
					<div class="cell product"><a href="<%=request.getContextPath() %>/admin/product.jsp" class="button is-medium is-fullwidth is-link is-light">상품 관리</a></div>
					<div class="cell member"><a href="<%=request.getContextPath() %>/admin/member.jsp" class="button is-medium is-fullwidth is-link">회원정보 확인</a></div>
					<div class="cell gift"><a href="<%=request.getContextPath() %>/admin/gifticon.jsp" class="button is-medium is-fullwidth is-link is-light">기프티콘 관리</a></div>
				</div>
			</div>
			<h3 class="subtitle is-3">회원 : aaa</h3>
			<div class="grid is-gap-8">
				<div class="cell write">
					<h4 class="title is-4">작성한 글 목록</h4>
					<table class="table is-bordered is-striped is-fullwidth">
						<colgroup>
							<col width="60">
							<col width="">
							<col width="100">
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
						<tbody>
							<tr>
								<td>5</td>
								<td><a href="#">제목입니다.</a></td>
								<td>24.06.27</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="#">제목제목입니다.</a></td>
								<td>24.06.27</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="#">제목입니다.</a></td>
								<td>24.06.27</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="#">제목입니다.</a></td>
								<td>24.06.27</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="#">제목제목입니다.</a></td>
								<td>24.06.27</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cell comment">
					<h4 class="title is-4">작성한 댓글 목록</h4>
					<table class="table is-bordered is-striped is-fullwidth">
						<colgroup>
							<col width="60">
							<col width="">
							<col width="100">
							<col width="70">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>내용</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3</td>
								<td><a href="#">댓글달았어요</a></td>
								<td>24.06.27</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="#">댓글댓글댓글</a></td>
								<td>24.06.26</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="#">댓글댓댓글</a></td>
								<td>24.06.24</td>
								<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>