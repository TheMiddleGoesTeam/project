<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.ProductVO" %>
<%@ page import="com.dao.ProductDAO" %>

<%
	List<ProductVO> getproductList=null;
	ProductDAO getpro = ProductDAO.getInstance();
	getproductList= getpro.getproduct();

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
					<div class="cell product"><a href="<%=request.getContextPath() %>/admin/product.jsp"" class="button is-medium is-fullwidth is-link">상품 관리</a></div>
					<div class="cell member"><a href="<%=request.getContextPath() %>/admin/member.jsp" class="button is-medium is-fullwidth is-link is-light">회원정보 확인</a></div>
					<div class="cell gift"><a href="<%=request.getContextPath() %>/admin/gifticon.jsp" class="button is-medium is-fullwidth is-link is-light">기프티콘 관리</a></div>
				</div>
			</div>
			<div class="inner">
				<div class="buttons is-right">
					<a href="<%=request.getContextPath() %>/admin/product_upload.jsp" class="button is-link is-dark"><i class="fa-solid fa-plus"></i>상품 추가</a>
				</div>
				<table class="table is-bordered is-striped is-fullwidth">
					<thead>
						<tr>
							<th>상품 코드</th>
							<th>상품명</th>
							<th>브랜드</th>
							<th>카테고리</th>
							<th>이미지</th>
							<th>기타</th>
						</tr>
					</thead>
					<tbody>
					<%
					for(int i =0; i<getproductList.size();i++){
							ProductVO pro = (ProductVO)getproductList.get(i);
					%>
					
						<tr>
							<td rowspan='2'><%=pro.getpCode() %></td>
							<td><%=pro.getpName() %></td>
							<td><%=pro.getpBrand() %></td>
							<td><%=pro.getpCat() %></td>
							<td><img src="<%=request.getContextPath() %>/img/<%=pro.getpImg() %>" width="200" height="200" alt=""></td>
							<td><button type="button" class="button is-small is-danger is-dark">삭제하기</button></td>
						</tr>
						<tr>
							<td colspan='6'><%=pro.getpComment() %></td>
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