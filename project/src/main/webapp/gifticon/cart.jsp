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
			<div class="inner">
				<table class="table is-fullwidth">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th>코드</th>
							<th>브랜드</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<label class="checkbox">
									<input type="checkbox" />
								</label>
							</td>
							<td class="img"><img src="<%=request.getContextPath() %>/img/gifticon_Signature_Chocolate.jpg" alt=""></td>
							<td>0003</td>
							<td>스타벅스</td>
							<td>시그니처 초콜릿</td>
							<td class="price">5000 마일리지</td>
							<td>1</td>
							<td>
								<button type="button"><i class="fa-solid fa-trash"></i></button>
							</td>
						</tr>
						<tr>
							<td>
								<label class="checkbox">
									<input type="checkbox" />
								</label>
							</td>
							<td class="img"><img src="<%=request.getContextPath() %>/img/gifticon_Signature_Chocolate.jpg" alt=""></td>
							<td>0003</td>
							<td>스타벅스</td>
							<td>시그니처 초콜릿</td>
							<td class="price">5000 마일리지</td>
							<td>1</td>
							<td>
								<button type="button"><i class="fa-solid fa-trash"></i></button>	
							</td>
						</tr>
						<tr>
							<td>
								<label class="checkbox">
									<input type="checkbox" />
								</label>
							</td>
							<td class="img"><img src="<%=request.getContextPath() %>/img/gifticon_Signature_Chocolate.jpg" alt=""></td>
							<td>0003</td>
							<td>스타벅스</td>
							<td>시그니처 초콜릿</td>
							<td class="price">5000 마일리지</td>
							<td>2</td>
							<td>
								<button type="button"><i class="fa-solid fa-trash"></i></button>	
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>