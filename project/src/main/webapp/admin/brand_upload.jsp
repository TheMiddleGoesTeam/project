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
					<div class="cell brand"><a href="<%=request.getContextPath() %>/admin/brand.jsp" class="button is-medium is-fullwidth is-link">브랜드 관리</a></div>
					<div class="cell product"><a href="#" class="button is-medium is-fullwidth is-link is-light">상품 관리</a></div>
					<div class="cell member"><a href="<%=request.getContextPath() %>/admin/member.jsp" class="button is-medium is-fullwidth is-link is-light">회원정보 확인</a></div>
					<div class="cell gift"><a href="<%=request.getContextPath() %>/admin/gifticon.jsp" class="button is-medium is-fullwidth is-link is-light">기프티콘 관리</a></div>
				</div>
			</div>
			<div class="inner">
				<div class="grid">
					<div class="cell txt">
						<div class="file">
							<label class="file-label">
								<input class="file-input" type="file" name="resume" />
								<span class="file-cta">
									<span class="file-icon">
										<i class="fas fa-upload"></i>
									</span>
									<span class="file-label"> Choose a file… </span>
								</span>
							</label>
						</div>
						<input type="text" name="brandName" value="" class="input" placeholder="브랜드명">
						<input type="text" name="brandSite" value="" class="input" placeholder="브랜드 홈페이지">
					</div>
					<div class="cell img"></div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>