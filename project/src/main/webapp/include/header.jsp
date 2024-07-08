<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="headerdao" class="com.dao.MemberDAO" />
<jsp:useBean id="miledao" class="com.dao.MileageDAO" />

<%
	String loginID = (String)session.getAttribute("loginID");
	int admincheck = headerdao.admincheck(loginID);
	
	int mile = miledao.showmilleage(loginID);
%>
	<header>
		<nav class="navbar" role="navigation" aria-label="main navigation">
			<div class="inner">
				<div class="navbar-brand">
					<a class="navbar-item logo" href="<%=request.getContextPath() %>/index.jsp">
						<img src="<%=request.getContextPath() %>/img/logo.svg" alt="ACG">
					</a>
					<a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarMenu"></a>
				</div>
				<div id="navbarMenu" class="navbar-menu">
					<div class="nav">
						<a href="<%=request.getContextPath() %>/page/about.jsp"><p>about</p><span class="on">about</span><span class="off">about</span></a>
						<a href="<%=request.getContextPath() %>/page/brand.jsp"><p>brand</p><span class="on">brand</span><span class="off">brand</span></a>
						<a href="<%=request.getContextPath() %>/product/all_products.jsp"><p>product</p><span class="on">product</span><span class="off">product</span></a>
						<a href="<%=request.getContextPath() %>/community/all_boards.jsp"><p>community</p><span class="on">community</span><span class="off">community</span></a>
					</div>
					<!-- 
					<div class="field has-addons has-addons-right">
						<p class="control">
							<input class="input" type="text" placeholder="검색어를 입력하세요">
						</p>
						<p class="control">
							<button class="button"><i class="fa-solid fa-magnifying-glass"></i></button>
						</p>
					</div>
					 -->
				</div>
			</div>
			<div class="navbar-end">
				<div class="navbar-item">
					<%
						if (loginID != null) { // 로그인 성공
							session.setAttribute("loginID", loginID);
							if(admincheck == 1){
					%>
					<div class="buttons">
						<a href="<%=request.getContextPath() %>/gifticon/all_gifticons.jsp" class="button is-warning has-text-white">기프티콘샵</a>
						<a href="<%=request.getContextPath() %>/admin/main.jsp" class="button is-link">Admin</a>
						<a href="<%=request.getContextPath() %>/common/logout.jsp" class="button is-light">Logout</a>
					</div>
					<%
						}else if(admincheck == -1){
					%>
					<div class="buttons">
						<div class="mileage">내 마일리지 : <%=mile %></div>
						<a href="<%=request.getContextPath() %>/gifticon/all_gifticons.jsp" class="button is-warning has-text-white">기프티콘샵</a>
						<a href="<%=request.getContextPath() %>/mypage/info.jsp" class="button is-success has-text-white">My page</a>
						<a href="<%=request.getContextPath() %>/common/logout.jsp" class="button is-light">Logout</a>
					</div>
					<% }
							} else {	%>
					<div class="buttons">
						<a href="<%=request.getContextPath() %>/common/login.jsp" class="button is-success has-text-white">Login</a>
						<a href="<%=request.getContextPath() %>/common/signup.jsp" class="button is-light">Sign up</a>
					</div>
					<% } %>
				</div>
			</div>
		</nav>
	</header>