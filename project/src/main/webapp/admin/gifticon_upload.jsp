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
			
			<form action="gifticon_uploadProc.jsp" method="post" class="is-fullwidth"
				name="gifticonupdate">
			
			<div class="inner">
				<div class="grid">
					<div class="cell txt">
						기프티콘 코드 <input type="text" name="giftCode"  class="input" >
						기프티콘 이름<input type="text" name="giftName"  class="input" >
						기프티콘 브랜드<input type="text" name="giftBrand"  class="input" >
						기프티콘 카테고리<input type="text" name="giftCat"  class="input" >
						기프티콘 가격<input type="number" name="giftPrice"  class="input" >
						기프티콘 설명<input type="text" name="giftComment"  class="input" >
						기프티콘 이미지<input type="text" name="giftImage"  class="input" >
						<input type="submit" value="입력" class="button is-success has-text-white">
					</div>
					<div class="cell img"></div>
				</div>
			</div>
	</form>

		</div>

		
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>