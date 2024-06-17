<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">정보 게시판<i></i></div>
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
					<td>34067</td>
					<td><a href="#">[K리그2 리뷰] 충남아산, 부산과 0-0 무...7위 유지+무려 5개 팀과 승점 동률→역대급 혼전</a></td>
					<td>축구가좋아</td>
					<td>2024.06.16</td>
					<td>3</td>
				</tr>
				<tr>
					<td>34066</td>
					<td><a href="#">'신민재 끝내기 희플!' LG, 3-8에서 9-8 극장승…롯데 마무리 김원중 5아웃 무리였나, 9회말 2아웃 블론S</a></td>
					<td>야구보고저혈압치료함</td>
					<td>2024.06.16</td>
					<td>100</td>
				</tr>
				<tr>
					<td>34065</td>
					<td><a href="#">‘호랑이 기운 미쳤다’ KIA, 343일 만에 KT 3연전 싹쓸이! 이우성 결승타&김도영 쐐기포 폭발 [수원 리뷰]</a></td>
					<td>출처는스포츠뉴스</td>
					<td>2024.06.16</td>
					<td>50</td>
				</tr>
				<tr>
					<td>34064</td>
					<td><a href="#">'낫아웃 어필' 염경엽 감독 퇴장!</a></td>
					<td>누구세요</td>
					<td>2024.06.15</td>
					<td>1024</td>
				</tr>
				<tr>
					<td>34063</td>
					<td><a href="#">5연승 하던 삼성 라이온즈, NC 다이노스에 2연패</a></td>
					<td>누구세요</td>
					<td>2024.06.15</td>
					<td>1113</td>
				</tr>
				<tr>
					<td>34062</td>
					<td><a href="#">[K리그2 리뷰] 충남아산, 부산과 0-0 무...7위 유지+무려 5개 팀과 승점 동률→역대급 혼전</a></td>
					<td>축구가좋아</td>
					<td>2024.06.14</td>
					<td>3</td>
				</tr>
				<tr>
					<td>34061</td>
					<td><a href="#">'신민재 끝내기 희플!' LG, 3-8에서 9-8 극장승…롯데 마무리 김원중 5아웃 무리였나, 9회말 2아웃 블론S</a></td>
					<td>야구보고저혈압치료함</td>
					<td>2024.06.14</td>
					<td>100</td>
				</tr>
				<tr>
					<td>34060</td>
					<td><a href="#">‘호랑이 기운 미쳤다’ KIA, 343일 만에 KT 3연전 싹쓸이! 이우성 결승타&김도영 쐐기포 폭발 [수원 리뷰]</a></td>
					<td>출처는스포츠뉴스</td>
					<td>2024.06.14</td>
					<td>50</td>
				</tr>
				<tr>
					<td>34059</td>
					<td><a href="#">'낫아웃 어필' 염경엽 감독 퇴장!</a></td>
					<td>누구세요</td>
					<td>2024.06.13</td>
					<td>1024</td>
				</tr>
				<tr>
					<td>34058</td>
					<td><a href="#">5연승 하던 삼성 라이온즈, NC 다이노스에 2연패</a></td>
					<td>누구세요</td>
					<td>2024.06.12</td>
					<td>1113</td>
				</tr>
			</table>
			<div class="buttons is-right">
				<a href="writeForm.jsp" class="button is-success write">글쓰기</a>
			</div>

			<div class="paging filed">
				<div class="buttons has-addons is-centered">
					<a href="#" class="button prev">이전</a>
					<a href="#" class="button">1</a>
					<a href="#" class="button">2</a>
					<a href="#" class="button is-seleted">3</a>
					<a href="#" class="button">4</a>
					<a href="#" class="button">5</a>
					<a href="#" class="button next">다음</a>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>