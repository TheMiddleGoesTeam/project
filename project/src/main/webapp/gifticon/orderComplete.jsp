<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/gifticon.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">장바구니<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/gifticon/all_gifticons.jsp">gifticon</a>
			</div>
		</div>
	</section>
	<section class="section gifticon cart">
		<div class="container">
			<div class="inner box" style="width: 500px; text-align: center;">
				<h4 class="title is-4">주문이 완료되었습니다.</h4>
				<a href="all_gifticons.jsp" class="cell is-medium button is-dark is-fullwidth">돌아가기</a>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>