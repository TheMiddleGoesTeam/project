<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.dao.MemberDAO" />
<%@ page import="com.vo.*" %>
<%@ page import="com.dao.MemberDAO" %>
<jsp:setProperty property = "*" name="vo"/>

<%@ include file="/include/document.jsp" %>

<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mypage.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/regscript.js"></script>

</head>

<body>
	<%@ include file="/include/header.jsp" %>
	<%
		MemberVO vo = dao.getMember(loginID);
	%>
	<section class="titles">
		<div class="inner">
			<div class="title_main">마이페이지<i></i></div>
			<div class="map_list">
				<a href="<%=request.getContextPath()%>/index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/mypage/info.jsp">my page</a>
			</div>
		</div>
	</section>
	<section id="mypage" class="section info">
		<div class="menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/mypage/product.jsp" class="button is-medium is-rounded is-success">좋아하는 상품</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/review.jsp" class="button is-medium is-rounded">리뷰한 상품</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/write.jsp" class="button is-medium is-rounded">내 글 목록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/comment.jsp" class="button is-medium is-rounded">내 댓글 목록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/info.jsp" class="button is-medium is-rounded">내 정보 수정</a></li>
				<li><a href="<%=request.getContextPath()%>/common/deleteForm.jsp" class="button is-medium is-rounded">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="container">
			<form action="infoProc.jsp" method="post" name="myInfo">
				<div class="goods_wrap">
					<div class="goods">
						<a href="#">
							<div class="img"><img src="<%=request.getContextPath() %>/img/starbucks_01.jpg" alt=""></div>
							<div class="txt">
								<div class="comment">스타벅스</div>
								<div class="name">제주 리유저블 콜드컵 세트 709ml 3p 세트</div>
							</div>
						</a>
						<div class="buttons is-centered">
							<button class="button is-success is-light is-medium">좋아요 해제</button>
						</div>
					</div>
					<div class="goods">
						<a href="#">
							<div class="img"><img src="<%=request.getContextPath() %>/img/starbucks_02.jpg" alt=""></div>
							<div class="txt">
								<div class="comment">스타벅스</div>
								<div class="name">그린 워드마크 폼 콜드컵 473ml</div>
							</div>
						</a>
						<div class="buttons is-centered">
							<button class="button is-success is-light is-medium">좋아요 해제</button>
						</div>
					</div>
					<div class="goods">
						<a href="#">
							<div class="img"><img src="<%=request.getContextPath() %>/img/starbucks_03.jpg" alt=""></div>
							<div class="txt">
								<div class="comment">스타벅스</div>
								<div class="name">SS 블랙 탱크 텀블러 503ml</div>
							</div>
						</a>
						<div class="buttons is-centered">
							<button class="button is-success is-light is-medium">좋아요 해제</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>