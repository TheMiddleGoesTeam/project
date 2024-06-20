<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.boardone.BoardDAO" %>
<%@ page import="com.boardone.BoardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try {
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.getArticle(num);
		
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
%>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.0/css/bulma.min.css">
<script type="text/javascript" src="script.js"></script>
<style type="text/css" media="screen">
	body * {font-family: 'Pretendard', sans-serif;}
	.table tr th {vertical-align: middle;}
</style>
</head>
<body>
	<section class="section">
		<div class="container" align="center">
			<h3 class="title">글 상세보기</h3>
			<form action="">
				<table class="table" align="center">
					<thead>
						<tr>
							<th align="center" width="125">번호</th>
							<th align="center" width="125"><%= article.getNum() %></th>
							<th align="center" width="125">조회수</th>
							<th align="center" width="125"><%= article.getReadcount() %></th>
						</tr>
						<tr>
							<th align="center" width="125">작성자</th>
							<th align="center" width="125"><%= article.getWriter() %></th>
							<th align="center" width="125">작성일</th>
							<th align="center" width="125"><%= sdf.format(article.getRegdate()) %></th>
						</tr>
						<tr>
							<th align="center" width="125">제목</th>
							<th align="center" width="375" colspan="3"><%= article.getSubject() %></th>
						</tr>
					</thead>
					<tr>
						<td align="center" width="125">내용</td>
						<td align="center" colspan="3"><%= article.getContent() %></td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="buttons is-right">
								<input type="button" value="답변글" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%= ref %>&step=<%= step %>&depth=<%= depth %>'" class="button is-info has-text-light" style="margin-right: auto;">
								<input type="button" value="수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%= pageNum %>'" class="button is-primary has-text-light">
								<input type="button" value="삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%= pageNum %>'" class="button is-danger has-text-light">
								<input type="button" value="목록" onclick="document.location.href='list.jsp?num=<%=article.getNum()%>&pageNum=<%= pageNum %>'" class="button is-dark">
							</div>
						</td>
					</tr>
				</table>
				<% } catch (Exception e) {} %>
			</form>
		</div>
	</section>
</body>
</html>