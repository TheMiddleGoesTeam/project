<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/document.jsp" %>
<%
 
	int rNum=Integer.parseInt(request.getParameter("rNum"));
	String pageNum = request.getParameter("pageNum");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
</head>
<body>
    <%@ include file="/include/header.jsp" %>
    <section class="titles">
        <div class="inner">
            <div class="title_main">리뷰 게시판<i></i></div>
            <div class="map_list">
                <a href="index.jsp" class="home"><i class="fa-solid fa-house"></i></a>
                <span class="arrow"><i class="fa-solid fa-angle-right"></i></span>
                <a href="<%=request.getContextPath() %>/community/all_boards.jsp">community</a>
            </div>
        </div>
    </section>
   
    <section class="section community write">
        <div class="container">
	        <div class="container-740">
	        	   <h3 class="title">글 삭제</h2>
	            <form action="deleteProc.jsp" method="post" name="deleteForm" onsubmit="return writeSave();">
					<table class="table is-fullwidth">
						<tr>
							<td>비밀번호 입력</td>
						</tr>
						<tr>
							<td>
							<input type="password" size="10" maxlength="10" name="rPass" class="input">
							 <input type="hidden" name="rNum" value="<%=rNum%>">
							</td>
						</tr>
					</table>
					<div class="buttons is-right">
						<input type="button" value="목록으로 돌아가기" onclick="window.location='list.jsp';" class="button is-dark">
						<input type="submit" value="글삭제" class="button is-success">
					</div>
				</form>
	        </div>
        </div>
	</section>
    <%@ include file="/include/footer.jsp" %>
</body>
</html>