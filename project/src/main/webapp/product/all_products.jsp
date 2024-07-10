<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>


<%@ include file="/include/document.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.ProductVO" %>
<%@ page import="com.dao.ProductDAO" %>

<%
	List<ProductVO> productList=null;
	ProductDAO getgift = ProductDAO.getInstance();
	productList= getgift. getproduct();

%>






<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/product.css">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">상품 리스트<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath() %>/index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/product/all_products.jsp">product</a>
			</div>
		</div>
	</section>
	<section class="product section">
		<div class="container">
			<div class="inner">
				<div class="menu">
					<div class="grid main_category">
						<div class="cell all">
							<a href="#" class="button is-medium is-fullwidth is-success is-dark">전체</a>
						</div>
						<div class="cell brand">
							<a href="#" class="button is-medium is-fullwidth is-success is-outlined">브랜드별로 보기</a>
						</div>
						<div class="cell type">
							<a href="#" class="button is-medium is-fullwidth is-success is-outlined">종류별로 보기</a>
						</div>
					</div>
					<%-- <div class="sub_category brand">
						<button type="button" class="button is-success">스타벅스</button>
						<button type="button" class="button">할리스</button>
						<button type="button" class="button">투썸플레이스</button>
						<button type="button" class="button">이디야</button>
						<button type="button" class="button">블루보틀</button>
						<button type="button" class="button">메가커피</button>
						<button type="button" class="button">파스쿠찌</button>
						<button type="button" class="button">폴바셋</button>
						<button type="button" class="button">컴포즈커피</button>
						<button type="button" class="button">요거프레소</button>
						<button type="button" class="button">엔젤리너스</button>
						<button type="button" class="button">디저트39</button>
						<button type="button" class="button">매머드커피</button>
						<button type="button" class="button">텐퍼센트커피</button>
					</div> --%>
				</div>
				
				
				
				<div class="goods_wrap">
				
				<%
						for(int i =0; i<productList.size();i++){
							ProductVO pro = (ProductVO)productList.get(i);
					%>
					
					<div class="goods">
						<a href="<%=request.getContextPath() %>/product/details.jsp?proCode=<%=pro.getpCode()%>">
							<div class="img"><img src="<%=request.getContextPath() %>/img/<%=pro.getpImg() %>" alt=""></div>
							<div class="txt">
								<div class="comment"><%=pro.getpBrand() %></div>
								<div class="name"><%=pro.getpName()%></div>
							</div>
						</a>
					</div>
					
					<%} %>
					

				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>