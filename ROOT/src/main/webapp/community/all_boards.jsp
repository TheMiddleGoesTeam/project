<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">커뮤니티<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">community</a>
			</div>
		</div>
	</section>
	<section id="all_boards" class="section community">
		<div class="container">
			<div class="fixed-grid">
				<div class="grid">
					<div class="cell first">
						<div class="tit">
							<div class="subtitle is-3">공지사항</div>
							<a href="#" class="button is-light">더보기</a>
						</div>
						<table class="is-fullwidth">
							<tr>
								<td align="center">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</table>
					</div>
					<div class="cell second">
						<div class="tit">
							<div class="subtitle is-3">정보 게시판</div>
							<a href="<%=request.getContextPath() %>/community/list_2.jsp" class="button is-light">더보기</a>
						</div>
						<table class="table is-fullwidth">
							<tr>
								<td>
									<a href="#">
										<div>정보글 테스트 입니다.</div>
										<span>24.06.16</span>
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="#">
										<div>정보글정보글정보글 잘림테스트 테스트테스트테스트테스트테스</div>
										<span>24.06.10</span>
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="#">
										<div>정보글입니다.</div>
										<span>24.06.06</span>
									</a>
								</td>
							</tr>
						</table>
					</div>
					<div class="cell third">
						<div class="tit">
							<div class="subtitle is-3">자유 게시판</div>
							<a href="<%=request.getContextPath() %>/community/list.jsp" class="button is-light">더보기</a>
						</div>
						<table class="is-fullwidth">
							<tr>
								<td align="center">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</table>
					</div>
					<div class="cell fourth">
						<div class="tit">
							<div class="subtitle is-3">리뷰 게시판</div>
							<a href="#" class="button is-light">더보기</a>
						</div>
						<table class="is-fullwidth">
							<tr>
								<td align="center">게시판에 저장된 글이 없습니다.</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>