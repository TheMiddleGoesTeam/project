<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/page.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">한국의 프랜차이즈 카페<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath() %>/index.html" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">brand</a>
			</div>
		</div>
	</section>
	<section id="brand" class="section">
		<div class="inner">
			<div class="box_list">
				<div class="box_li">
					<a href="https://www.starbucks.co.kr/index.do" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand01.png" alt="스타벅스">
						<div class="hover">
							<div class="name">스타벅스</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.hollys.co.kr/" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand02.png" alt="할리스커피">
						<div class="hover">
							<div class="name">할리스커피</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.twosome.co.kr/main.do" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand03.png" alt="투썸플레이스">
						<div class="hover">
							<div class="name">투썸플레이스</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.ediya.com/" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand04.png" alt="이디야커피">
						<div class="hover">
							<div class="name">이디야커피</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.bluebottlecoffeekorea.com/" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand05.png" alt="블루보틀">
						<div class="hover">
							<div class="name">블루보틀</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.mega-mgccoffee.com/" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand06.png" alt="메가커피">
						<div class="hover">
							<div class="name">메가커피</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.caffe-pascucci.co.kr/" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand07.png" alt="파스쿠찌">
						<div class="hover">
							<div class="name">파스쿠찌</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
				<div class="box_li">
					<a href="https://www.baristapaulbassett.co.kr/Index.pb" target="_blank">
						<img src="<%=request.getContextPath() %>/img/brand08.png" alt="폴 바셋">
						<div class="hover">
							<div class="name">폴 바셋</div>
							<p>홈페이지 바로가기</p>
							<span class="bg"></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>