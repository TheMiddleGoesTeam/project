<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

<%@ page import="java.util.*" %>
<%@ page import="com.vo.MemberVO" %>
<%@ page import="com.dao.MemberDAO" %>


<%
	List<MemberVO> adminMemberList=null;
	MemberDAO adgmem = MemberDAO.getInstance();
	adminMemberList = adgmem. admingetMember();

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
	<section id="admin" class="section member">
		<div class="container">
			<div class="menu">
				<div class="grid">
					<div class="cell brand"><a href="<%=request.getContextPath() %>/admin/brand.jsp" class="button is-medium is-fullwidth is-link is-light">브랜드 관리</a></div>
					<div class="cell product"><a href="<%=request.getContextPath() %>/admin/product.jsp" class="button is-medium is-fullwidth is-link is-light">상품 관리</a></div>
					<div class="cell member"><a href="<%=request.getContextPath() %>/admin/member.jsp" class="button is-medium is-fullwidth is-link">회원정보 확인</a></div>
					<div class="cell gift"><a href="<%=request.getContextPath() %>/admin/gifticon.jsp" class="button is-medium is-fullwidth is-link is-light">기프티콘 관리</a></div>
				</div>
				
			</div>
			<div class="inner">
				<table class="table is-bordered is-striped">
					<colgroup>
						<col width="100">
						<col width="">
						<col width="">
						<col width="">
						<col width="50">
						<col width="50">
					</colgroup>
					<thead>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>마일리지</th>
							<th>비고</th>
							<th>회원삭제</th>
						</tr>
					</thead>
					
					<%
						for(int i =0; i<adminMemberList.size();i++){
							MemberVO mem = (MemberVO)adminMemberList.get(i);
					%>
						<tr>
							<td><%=mem.getmNum() %></td>
							<td><%=mem.getmID() %></p></td>
							<td><%=mem.getmNic() %></td>
							<td><%=mem.getmMileage() %></td>
							<td><a href="<%=request.getContextPath() %>/admin/member_info.jsp?mNum=<%=mem.getmNum() %>&&mID=<%=mem.getmID() %>" class="button is-small is-link is-dark">상세보기</a></td>
							<td><a href="<%=request.getContextPath() %>/admin/removeform.jsp?mNum=<%=mem.getmNum() %>&&mID=<%=mem.getmID() %>" class="button is-small is-danger is-dark">회원삭제</a></td>
						

						</tr>
					<%} %>
					
					<tbody>
						
						
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>