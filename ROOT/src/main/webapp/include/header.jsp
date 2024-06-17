<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
						<a href="javascript: alert('준비중인 페이지입니다!');"><p>product</p><span class="on">product</span><span class="off">product</span></a>
						<a href="<%=request.getContextPath() %>/community/all_boards.jsp"><p>community</p><span class="on">community</span><span class="off">community</span></a>
					</div>
					<div class="field has-addons has-addons-right">
						<p class="control">
							<input class="input" type="text" placeholder="검색어를 입력하세요">
						</p>
						<p class="control">
							<button class="button"><i class="fa-solid fa-magnifying-glass"></i></button>
						</p>
					</div>
				</div>
			</div>
			<div class="navbar-end">
				<div class="navbar-item">
					<div class="buttons">
						<a href="<%=request.getContextPath() %>/common/login.jsp" class="button is-success has-text-white">Login</a>
						<a href="<%=request.getContextPath() %>/common/signup.jsp" class="button is-light">Sign up</a>
					</div>
				</div>
			</div>
		</nav>
	</header>