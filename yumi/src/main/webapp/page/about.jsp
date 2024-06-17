<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/page.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">ACG에 대해<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath() %>/index.html" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="#">about</a>
			</div>
		</div>
	</section>
	<section id="about" class="section">
		<div class="inner">
			<article>
				<h1 class="subtitle is-2">ACG가 무엇인가요?</h1>
				<p>ACG란 All Cafe Goods의 약어로, 국내의 다양한 프랜차이즈 카페들이 보유한 굿즈 상품들을 한 곳에서 손쉽게 비교하고 구매할 수 있는 웹사이트를 말합니다. <br>ACG를 통해 사용자들은 다양한 카페의 굿즈 상품들을 한눈에 볼 수 있으며, 자신에게 맞는 제품을 선택할 수 있습니다.</p>
			</article>
			<article>
				<h1 class="subtitle is-2">ACG 개발 이유</h1>
				<p>대형 프랜차이즈 카페의 굿즈 다양성은 소비자에게 선택의 폭을 넓혀주었지만, 각 카페의 제품을 비교하기가 어려워졌습니다. 이로 인해 소비자들은 원하는 굿즈를 찾기 위해 여러 사이트를 돌아다니며 비교해야 하는 불편함을 겪고 있습니다. 이러한 불편함을 해소하여 여러 카페의 제품을 쉽게 찾아 비교할 수 있도록 하는 웹사이트를 기획하였습니다.</p>
				<p>ACG는 각 프랜차이즈 카페의 굿즈를 종합적으로 제공하고, 카테고리별로 분류하여 사용자들이 원하는 상품을 쉽게 찾을 수 있도록 합니다.</p>
			</article>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>