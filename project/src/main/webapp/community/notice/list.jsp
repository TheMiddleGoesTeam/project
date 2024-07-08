<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/document.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.Board_NoticeVO" %>
<%@ page import="com.dao.Board_NoticeDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%!
//한페이지에 보여줄 글 수
int pageSize=10;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
String pageNum = request.getParameter("pageNum");


	if(pageNum==null){
		pageNum="1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow=(currentPage-1)*pageSize;
	int endRow = currentPage*pageSize;
 	int count = 0;
	int number=0;

	List<Board_NoticeVO>articleList = null;
	Board_NoticeDAO dbPro = Board_NoticeDAO.getInstance();
	
	count = dbPro.getArticleCount();

	if(count>0){
		// articleList = dbPro.getArticles();
		articleList = dbPro.getArticles(startRow,endRow);
 	}
	

	number = count; number = count;
	// number = count-(currentPage-1)*pageSize+1;
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
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
			<div class="inner container-960">
				<table class="table is-fullwidth is-hoverable">
					<colgroup>
						<col width="100">
						<col width="">
						<col width="200">
						<col width="200">
						<col width="100">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
				<%
					if(count==0){//글이 없을 경우
				%>

					<tr>
						<td colspan="5" class="none">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</table>

				<%}else{//글이 있을 경우%>
				<%
					for(int i=0;i< articleList.size();i++){
						Board_NoticeVO article = (Board_NoticeVO)articleList.get(i);
					%>
					<tr>
						<td><%=article.getnNum()%></td>
						<td><a href="content.jsp?num=<%=article.getnNum()%>&pageNum=<%=currentPage%>">
						<%=article.getnTitle() %></a></td>
						<td><%=article.getnWriter()%></td>
						<td><%=sdf.format(article.getnDate())%></td>
						<td><%= article.getnReadCount() %></td>
					</tr>

				<%} %>
		
			</table>
		
			<%} %>

				<div class="buttons is-right">
					<a href="writeForm.jsp" class="button is-success write">글쓰기</a>
				</div>
				
				<div class="paging filed">
					<div class="buttons has-addons is-centered">
		
					<%
						if(count > 0){
							int pageBlock=2;
							int imsi =count% pageSize == 0 ? 0:1;
							int pageCount = count/pageSize +imsi;
							
							int startPage = (int)((currentPage -1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock -1;
							
							if(endPage > pageCount) endPage = pageCount;
							
							if(startPage > pageBlock){
					%>
					<a href="list.jsp?pageNum=<%=startPage-pageBlock%>" class="button prev">이전</a>
					<%}
				 		for(int i=startPage; i<=endPage; i++){
					%>
						<%
							if (i == currentPage) { // 페이징 번호가 맞다면 selected 클래스 적용
						%>
							<a href="list.jsp?pageNum=<%=i%>" class="button is-selected"><%=i %></a>
						<%
							} else {
						%>
							<a href="list.jsp?pageNum=<%=i%>" class="button"><%=i %></a>
						<%
							}
						%>

					<%
						} if(endPage < pageCount){
					%>
						<a href="list.jsp?pageNum=<%=startPage+pageBlock%>" class="button next">다음</a>
							
					<%
							}
						}//if(count) end 
					%>
					</div>
				</div>
				
				<div class="field has-addons has-addons-centered search">
						<p class="control">
							<input class="input" type="text" placeholder="검색어를 입력하세요">
						</p>
						<p class="control">
							<button class="button"><i class="fa-solid fa-magnifying-glass"></i></button>
						</p>
					</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>