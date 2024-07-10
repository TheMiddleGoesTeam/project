<%@page import="org.xml.sax.helpers.ParserAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vo.*" %>
<%@ page import="com.dao.Board_NoticeDAO" %>
<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/writescript.js"></script>

</head>
<body>
    <%@ include file="/include/header.jsp" %>
    <%
     int boardNum= Integer.parseInt(request.getParameter("num"));
    
    	Board_NoticeDAO dbPro=Board_NoticeDAO.getInstance();
		Board_NoticeVO vo = dbPro.updateGetArticle(boardNum);
	%>
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
    <%
   int num = 0,ref=1,step=0,depth=0;

try{
	
		num=Integer.parseInt(request.getParameter("num"));
	

%>
    <section class="section community write">
        <div class="container">
	        <div class="container-740">
	        	<h3 class="title">수정하기</h2>
	            <form action="updateProc.jsp" method="post" name="updateForm" onsubmit="return writeSave();">
					
					<input type ="hidden" name="nNum"	 value="<%=num %>"	>
					<input type ="hidden" name="nRef"	 value="<%=ref %>"	>	
					<input type ="hidden" name="nStep"	 value="<%=step %>"	>	
					<input type ="hidden" name="nepth"	 value="<%=depth %>"	>
					
					
					<table class="table is-fullwidth">
						<tr>
							<th>이름</th>
							<td><input type="text" size="12" maxlength="12" name="nWriter" class="input"  value="<%=vo.getnWriter()%>"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" size="50" maxlength="50" name="nTitle" class="input" value="<%= vo.getnTitle() %>">
								
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="13" cols="50" name="nContents" class="textarea" ><%= vo.getnContents() %></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" size="10" maxlength="10" name="nPass" class="input" value="<%= vo.getnPass() %>"></td>
						</tr>
					</table>
					<div class="buttons is-right">
						<input type="button" value="목록으로 돌아가기" onclick="window.location='list.jsp';" class="button is-dark">
						<input type="reset" value="다시작성" class="button is-light">
						<input type="submit" value="수정" class="button is-warning">
					</div>
				</form>
				<%
				}catch(Exception e){e.printStackTrace();}
				%>
	        </div>
        </div>
	</section>
    <%@ include file="/include/footer.jsp" %>
</body>
</html>