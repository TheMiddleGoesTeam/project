 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/writescript.js"></script>

</head>
<body>
    <%@ include file="/include/header.jsp" %>
    <section class="titles">
        <div class="inner">
            <div class="title_main">자유 게시판<i></i></div>
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
	if(request.getParameter("fNum")!=null){
		num=Integer.parseInt(request.getParameter("fNum"));
		ref=Integer.parseInt(request.getParameter("fRef"));
		step=Integer.parseInt(request.getParameter("fStep"));
		depth=Integer.parseInt(request.getParameter("fDepth"));
	}
%>
    <section class="section community write">
        <div class="container">
	        <div class="container-740">
	        	<h3 class="title">글쓰기</h2>
	            <form action="writeProc.jsp" method="post" name="writeForm" onsubmit="return writeSave();">
					
					<input type ="hidden" name="fNum"	 value="<%=num %>"	>
					<input type ="hidden" name="fRef"	 value="<%=ref %>"	>	
					<input type ="hidden" name="fStep"	 value="<%=step %>"	>	
					<input type ="hidden" name="fDepth"	 value="<%=depth %>"	>
					
					
					<table class="table is-fullwidth">
						<tr>
							<th>이름</th>
							<td><input type="text" size="12" maxlength="12" name="fWriter" class="input" value="<%=loginID %>"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<!-- <% if (request.getParameter("fNum") == null) { // 새 글일 경우 %>-->
								<input type="text" size="50" maxlength="50" name="fTitle" class="input">
								<!-- <% } else { %> -->
								<input type="text" size="50" maxlength="50" name="fTitle" value="[답변] " class="input">
								<!-- <% } %>-->
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="13" cols="50" name="fContents" class="textarea"></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" size="10" maxlength="10" name="fPass" class="input"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<div class="buttons is-right">
									<input type="button" value="목록으로 돌아가기" onclick="window.location='list.jsp';" class="button is-dark">
									<input type="reset" value="다시작성" class="button is-light">
									<input type="submit" value="글쓰기" class="button is-success">
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