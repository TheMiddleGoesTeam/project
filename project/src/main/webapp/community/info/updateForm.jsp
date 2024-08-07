<%@page import="org.xml.sax.helpers.ParserAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vo.*" %>
<%@ page import="com.dao.BoardDAO" %>
<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/writescript.js"></script>

</head>
<body>
    <%@ include file="/include/header.jsp" %>
    <%
     int boardNum= Integer.parseInt(request.getParameter("num"));
    
    	BoardDAO dbPro=BoardDAO.getInstance();
		BoardVO vo = dbPro.updateGetArticle(boardNum);
	%>
    <section class="titles">
        <div class="inner">
            <div class="title_main">정보 게시판<i></i></div>
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
					
					<input type ="hidden" name="bNum"	 value="<%=num %>"	>
					<input type ="hidden" name="bRef"	 value="<%=ref %>"	>	
					<input type ="hidden" name="bStep"	 value="<%=step %>"	>	
					<input type ="hidden" name="depth"	 value="<%=depth %>"	>
					
					
					<table class="table is-fullwidth">
						<tr>
							<th>이름</th>
							<td><input type="text" size="12" maxlength="12" name="bWriter" class="input"  value="<%=vo.getbWriter()%>"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" size="50" maxlength="50" name="bTitle" class="input" value="<%= vo.getbTitle() %>">
								
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="13" cols="50" name="bContents" class="textarea" ><%= vo.getbContents() %></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" size="10" maxlength="10" name="bPass" class="input" value="<%= vo.getbPass() %>"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<div class="buttons is-right">
									<input type="button" value="목록으로 돌아가기" onclick="window.location='list.jsp';" class="button is-dark">
									<input type="reset" value="다시작성" class="button is-light">
									<input type="submit" value="수정" class="button is-warning">
								</div>
							</td>
						</tr>
					</table>
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