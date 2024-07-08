<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.*" %>
<%@ page import="com.dao.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd ");

	List<BoardVO>getAllBoardList_info = null;
	List<Board_FreeVO>getAllBoardList_free=null;
	List<Board_NoticeVO>getAllBoardList_notice=null;
	List<Board_ReviewVO>getAllBoardList_review=null;

	
	BoardDAO dbPro_info = BoardDAO.getInstance();
	Board_FreeDAO dbPro_free= Board_FreeDAO.getInstance();
	Board_NoticeDAO dbPro_notice = Board_NoticeDAO.getInstance();
	Board_ReviewDAO dbPro_review = Board_ReviewDAO.getInstance();
	
	getAllBoardList_info=dbPro_info.getAllBoardList();
	getAllBoardList_free = dbPro_free.getAllBoardList();
	getAllBoardList_notice = dbPro_notice.getAllBoardList();
	getAllBoardList_review = dbPro_review.getAllBoardList();
%>





<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<section class="titles">
		<div class="inner">
			<div class="title_main">커뮤니티<i></i></div>
			<div class="map_list">
				<a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
				<span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
				<a href="<%=request.getContextPath() %>/community/all_boards.jsp">community</a>
			</div>
		</div>
	</section>
	<section id="all_boards" class="section community">
		<div class="container">
			<div class="fixed-grid">
				<div class="grid">
					<div class="cell first">
						<div class="tit">
							<div class="subtitle is-3">공지사항</div>
							<a href="<%=request.getContextPath() %>/community/notice/list.jsp" class="button is-light">더보기</a>
						</div>
						<table class="table is-fullwidth">
							<%
  								for(int i=0;i< getAllBoardList_notice.size();i++){
  									Board_NoticeVO noticeList = (Board_NoticeVO)getAllBoardList_notice.get(i);
 						 %>
							<tr>
								<td>
									<a href="notice/content.jsp?num=<%=noticeList.getnNum()%>">
										<div><%=noticeList.getnTitle() %></div>
										<span><%=sdf.format(noticeList.getnDate()) %></span>
									</a>
								</td>
							</tr>
							<%} %>
						</table>
					</div>
					<div class="cell second">
						<div class="tit">
							<div class="subtitle is-3">정보 게시판</div>
							<a href="<%=request.getContextPath() %>/community/info/list.jsp" class="button is-light">더보기</a>
						</div>
						<table class="table is-fullwidth">
						<%
  								for(int i=0;i< getAllBoardList_info.size();i++){
  									BoardVO infoList = (BoardVO)getAllBoardList_info.get(i);
 						 %>
							<tr>
								<td>
									<a href="info/content.jsp?num=<%=infoList.getbNum()%>">
										<div><%=infoList.getbTitle() %></div>
										<span><%=sdf.format(infoList.getbDate()) %></span>
									</a>
								</td>
							</tr>
							<%} %>
						</table>
					</div>
					<div class="cell third">
						<div class="tit">
							<div class="subtitle is-3">자유 게시판</div>
							<a href="<%=request.getContextPath() %>/community/free/list.jsp" class="button is-light">더보기</a>
						</div>
						<table class="table is-fullwidth">
							<%
  								for(int i=0;i< getAllBoardList_free.size();i++){
  									Board_FreeVO freeList = (Board_FreeVO)getAllBoardList_free.get(i);
 						 %>
							<tr>
								<td>
									<a href="free/content.jsp?num=<%=freeList.getfNum()%>">
										<div><%=freeList.getfTitle() %></div>
										<span><%=sdf.format(freeList.getfDate()) %></span>
									</a>
								</td>
							</tr>
							<%} %>
						</table>
					</div>
					<div class="cell fourth">
						<div class="tit">
							<div class="subtitle is-3">리뷰 게시판</div>
							<a href="<%=request.getContextPath() %>/community/review/list.jsp" class="button is-light">더보기</a>
						</div>
						<table class="table is-fullwidth">
							<%
  								for(int i=0;i< getAllBoardList_review.size();i++){
  									Board_ReviewVO reviewList = (Board_ReviewVO)getAllBoardList_review.get(i);
 						 %>
							<tr>
								<td>
									<a href="review/content.jsp?num=<%=reviewList.getrNum()%>">
										<div><%=reviewList.getrTitle() %></div>
										<span><%=sdf.format(reviewList.getrDate()) %></span>
									</a>
								</td>
							</tr>
							<%} %>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>