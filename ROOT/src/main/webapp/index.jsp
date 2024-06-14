<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/index.css">
</head>
<body>
<%@ include file="include/header.jsp" %>

	<section class="index">
		<div class="swiper main">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="<%=request.getContextPath() %>/img/visual01.png" alt="스타벅스MD"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath() %>/img/visual02.png" alt="스타벅스MD"></div>
			</div>
		</div>
		<script type="module">
			const swiper = new Swiper('.swiper.main', {
				autoplay: {
					delay: 3000,
				},
				centeredSlides: true,
				loop: true
			});
		</script>

		<article class="best">
			<div class="inner">
				<div class="tit left">
					<h2 class="title is-1">best seller</h2>
					<p class="title is-3">가장 인기있는 굿즈를 <br>알아보세요</p>
				</div>
				<div class="contain">
					<ul>
						<li><a href="#"><img src="<%=request.getContextPath() %>/img/best1.png" alt="베스트셀러1"></a></li>
						<li><a href="#"><img src="<%=request.getContextPath() %>/img/best2.png" alt="베스트셀러2"></a></li>
						<li><a href="#"><img src="<%=request.getContextPath() %>/img/best3.png" alt="베스트셀러3"></a></li>
					</ul>
				</div>
			</div>
		</article>

		<article class="season">
			<div class="inner">
				<div class="tit right">
					<h2 class="title is-1">seasons goods</h2>
					<p class="title is-3">시즌 한정으로만 판매하는 <br>굿즈를 알아보세요</p>
				</div>
				<a href="#" class="more">더 많은 상품 보러 가기<i></i></a>
				<div class="contain">
					<div class="goods">
						<a href="#">
							<div class="img"><img src="" alt=""></div>
							<div class="txt">
								<span class="brand">투썸플레이스</span>
								<div class="name">텀블러 500ml</div>
							</div>
						</a>
					</div>
					<div class="goods">
						<a href="#">
							<div class="img"><img src="" alt=""></div>
							<div class="txt">
								<span class="brand">스타벅스</span>
								<div class="name">텀블러 500ml</div>
							</div>
						</a>
					</div>
					<div class="goods">
						<a href="#">
							<div class="img"><img src="" alt=""></div>
							<div class="txt">
								<span class="brand">투썸플레이스</span>
								<div class="name">텀블러 500ml</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</article>

		<article class="gifticon">
			<div class="inner">
				<a href="#"><img src="<%=request.getContextPath() %>/img/gifticon_bn.png" alt="기프티콘 구매 페이지 이동"></a>
			</div>
		</article>

		<!-- <article class="banner">
			<div class="inner">
				<a href="#" class="left">
					<div class="img"><img src="" alt=""></div>
					<p>브랜드로 살펴보기</p>
				</a>
				<a href="#" class="right">
					<div class="img"><img src="" alt=""></div>
					<p>종류별로 살펴보기</p>
				</a>
			</div>
		</article> -->

		<article class="thanks">
			<div class="tit left">
				<h2 class="title is-1">thanks</h2>
			</div>
			<div class="swiper thx">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo01.png" alt="스타벅스"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo02.png" alt="할리스커피"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo03.png" alt="이디야"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo04.png" alt="블루보틀"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo05.png" alt="투썸플레이스"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo06.png" alt="메가커피"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo07.png" alt="파스쿠찌"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo08.png" alt="폴바셋"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo09.png" alt="컴포즈커피"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo10.png" alt="요거프레소"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo11.png" alt="엔젤리너스"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo12.png" alt="디저트39"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo13.png" alt="매머드커피"></a></div>
					<div class="swiper-slide"><a href="#" target="_blank"><img src="<%=request.getContextPath() %>/img/logo14.png" alt="텐퍼센트커피"></a></div>
				</div>
				<!-- <div class="swiper-inner">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div> -->
			</div>
			<script type="module">
				const swiper = new Swiper('.swiper.thx', {
					autoplay: {
						delay: 3000,
					},
					// navigation: {
					// 	nextEl: '.swiper.thx .swiper-button-next',
					// 	prevEl: '.swiper.thx .swiper-button-prev',
					// },
					slidesPerView: 8,
					spaceBetween: 24,
					// centeredSlides: true,
					loop: true
				});
			</script>
		</article>
	</section>
	<%@ include file="include/footer.jsp" %>
	<script type="text/javascript" src="js/index.js"></script>
</body>
</html>