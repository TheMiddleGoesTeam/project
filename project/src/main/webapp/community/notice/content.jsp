<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.Board_NoticeDAO" %>
<%@ page import="com.vo.Board_NoticeVO" %>
<%@ page import="java.text.SimpleDateFormat" %>



<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
<%
	
	int fNum = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	try {
		
		Board_NoticeDAO dbPro = Board_NoticeDAO.getInstance();
		Board_NoticeVO article = dbPro.getArticle(fNum);
		
		int ref = article.getnRef();
		int step = article.getnStep();
		int depth = article.getnDepth();
		
%>
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">공지사항<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/community/all_boards.jsp">community</a>
			</div>
		</div>
	</section>
	<section class="section community list">
		<div class="container">
			<div class="container-960">
				<h3 class="title">글 상세보기</h3>
				<form action="">
					<table class="table is-fullwidth" align="center">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<tr>
								<td><%= article.getnNum() %></td>
								<td><%= article.getnTitle() %></td>
								<td><%= article.getnWriter() %></td>
								<td><%= article.getnDate() %></td>
								<td><%= article.getnReadCount() %></td>
								
							</tr>
						</thead>
						<tr>
						 <td colspan="5">
						 	<div class="content-min-height">
						 		<%= article.getnContents() %>
						 	</div>
						 </td> 
							
						</tr>
					</table>
					<div class="buttons is-right">
						<input type="button" value="목록으로 돌아가기" onclick="document.location.href='list.jsp?num=<%=article.getnNum()%>&pageNum=<%= pageNum %>'" class="button is-dark">
						<input type="button" value="수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getnNum()%>&pageNum=<%= pageNum %>'" class="button is-warning">
						<input type="button" value="삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getnNum()%>&pageNum=<%= pageNum %>'" class="button is-danger">
					</div>
					<% } catch (Exception e) {} %>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>