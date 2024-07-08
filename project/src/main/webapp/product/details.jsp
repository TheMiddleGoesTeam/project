<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/product.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">상품 상세보기<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath() %>/index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/product/all_products.jsp">product</a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">스타벅스</a>
			</div>
		</div>
	</section>
	<section class="section product details">
		<div class="container">
			<div class="inner">
				<div class="con">
					<div class="img">
						<div class="big">
							<img src="<%=request.getContextPath() %>/img/starbucks_01.jpg" alt="">
						</div>
						<ul class="small">
							<li><img src="<%=request.getContextPath() %>/img/starbucks_01.jpg" alt=""></li>
							<li><img src="<%=request.getContextPath() %>/img/starbucks_01.jpg" alt=""></li>
							<li><img src="<%=request.getContextPath() %>/img/starbucks_01.jpg" alt=""></li>
						</ul>
					</div>
					<div class="txt">
						<div class="name">제주 리유저블 콜드컵 세트 709ml (3p)</div>
						<div class="sub_name">Jeju reusable cold cup set 709ml (3p)</div>
						<p>[제주 지역 스타벅스 한정 판매 상품]<br>제주의 해변과 해녀를 710ml 컵에 담은 3종 세트 상품입니다.<br>*찬 음료 전용</p>

						<div class="btns">
							<div class="tags">
								<a href="#">#한정</a>
								<a href="#">#리유저블</a>
								<a href="#">#콜드컵</a>
								<a href="#">#식기세척기금지</a>
							</div>
							<div class="buttons">
								<button class="button is-light">좋아요</button>
								<button class="button is-light">사용후기(1)</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>