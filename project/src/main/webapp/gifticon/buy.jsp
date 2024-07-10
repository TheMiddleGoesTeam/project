<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

    <%@ page import="com.dao.GifticonDAO" %>
    <%@ page import="com.vo.GifticonVO" %>
     <%@ page import="java.util.*" %>
     
     
     
    
    <%
    List<GifticonVO> cart = (List<GifticonVO>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }
    
    
    
    %>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/gifticon.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">구매하기<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/gifticon/all_gifticons.jsp">gifticon</a>
			</div>
		</div>
	</section>
	<section class="section gifticon buy">
		<div class="container">
			<div class="list">
				<table class="table is-fullwidth">
					<thead>
						<tr>
							<th>주문번호</th>
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
					
					 <%  if(cart.isEmpty()){ %>
					 <tr>
					 	<td colspan="8">	상품이 없습니다	</td>
					 </tr>
					 <% }
					 	int total_price=0;
					 	for (int i = 0; i < cart.size(); i++) {
						    GifticonVO item = cart.get(i);
					 %>
					
						<tr>
							<td><%= i+1 %></td>
							<td class="img"><img src="<%=request.getContextPath() %>/img/<%= item.getGiftImage() %>" alt=""></td>
							<td><%= item.getGiftCode() %></td>
							<td><%= item.getGiftBrand() %></td>
							<td><%= item.getGiftName() %></td>
							<td class="price"><%= item.getGiftPrice() %> 마일리지</td>
							<td>1</td>
							<td>
								  <a href="removecartproc.jsp?delete=<%=i%>"><i class="fa-solid fa-trash"></i></a> 
							</td>
						</tr>
						
					<%
						total_price = total_price + item.getGiftPrice();
					 	} %>
						
					</tbody>
				</table>
				
				 <a href="all_gifticons.jsp"  class="cell is-medium button is-light">돌아가기</a>
			</div>
			
			<%
			 Map<String, Integer> countMap = new HashMap<>();
			
			for (GifticonVO gifticon : cart) {
	            String giftname = gifticon.getGiftName();
	            countMap.put(giftname, countMap.getOrDefault(giftname, 0) + 1);
	        }

	     %>
			
			
			
			<div class="total box">
				<div class="pp">
					<% for (Map.Entry<String, Integer> entry : countMap.entrySet()) {%>
			           <p> <%=  entry.getKey()%> <%= entry.getValue() %> 개 </p>
			        
			        <%}%>
				</div>
				<div class="tt">total : <%=total_price %> 마일리지</div>
				<a href="buyproc.jsp"class="button is-success is-large is-fullwidth">구매하기</a>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>