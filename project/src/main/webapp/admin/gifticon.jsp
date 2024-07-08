<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.GifticonVO" %>
<%@ page import="com.dao.GifticonDAO" %>

<%
	List<GifticonVO> getgiftList=null;
	GifticonDAO getgift = GifticonDAO.getInstance();
	getgiftList= getgift. getgifticon();

%>




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
	<section id="admin" class="section">
		<div class="container">
			<div class="menu">
				<div class="grid">
					<div class="cell brand"><a href="<%=request.getContextPath() %>/admin/brand.jsp" class="button is-medium is-fullwidth is-link is-light">브랜드 관리</a></div>
					<div class="cell product"><a href="#" class="button is-medium is-fullwidth is-link is-light">상품 관리</a></div>
					<div class="cell member"><a href="<%=request.getContextPath() %>/admin/member.jsp" class="button is-medium is-fullwidth is-link is-light">회원정보 확인</a></div>
					<div class="cell gift"><a href="<%=request.getContextPath() %>/admin/gifticon.jsp" class="button is-medium is-fullwidth is-link">기프티콘 관리</a></div>
				</div>
			</div>
			<div class="inner">
				<div class="buttons is-right">
					<a href="<%=request.getContextPath() %>/admin/gifticon_upload.jsp" class="button is-link is-dark"><i class="fa-solid fa-plus"></i>기프티콘 추가</a>
				</div>
				<table class="table is-bordered is-striped is-fullwidth">
					<thead>
						<tr>
							<th>기프티콘 코드</th>
							<th>상품명</th>
							<th>브랜드</th>
							<th>카테고리</th>
							<th>이미지</th>
							<th>가격</th>
							<th>기타</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i =0; i<getgiftList.size();i++){
							GifticonVO gift = (GifticonVO)getgiftList.get(i);
					%>
					
						<tr>
							<td rowspan='2'><%=gift.getGiftCode() %></td>
							<td><%=gift.getGiftName() %></td>
							<td><%=gift.getGiftBrand() %></td>
							<td><%=gift.getGiftCat() %></td>
							<td><img src="<%=request.getContextPath() %>/img/<%=gift.getGiftImage() %>" width="200" height="200" alt=""></td>
							<td><%=gift.getGiftPrice() %> 마일리지</td>
							<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
						</tr>
						<tr>
							<td colspan='6'><%=gift.getGiftComment() %></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>