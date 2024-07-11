<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/document.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vo.Board_FreeVO" %>
<%@ page import="com.dao.Board_FreeDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%!
    // 한 페이지에 보여줄 글 수
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
    String pageNum = request.getParameter("pageNum");

    // 무엇을 검색할 지 파라미터를 가져와야함(작성자, 제목, 내용)
    String searchWhat = request.getParameter("searchWhat");
    // 검색 내용
    String searchText = request.getParameter("searchText");

    // 파라미터를 가져와서 한글로 변환 처리
    if (searchText != null) {
        searchText = new String(searchText.getBytes("utf-8"), "utf-8");
    }

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;

    List<Board_FreeVO> articleList = null;
    Board_FreeDAO dbPro = Board_FreeDAO.getInstance();

    if (searchText == null) { // 검색이 아닐 경우
        count = dbPro.getArticleCount(); // 전체글의 목록 수

        if (count > 0) {
            articleList = dbPro.getArticles(startRow, endRow);
        }

    } else { // 검색인 경우
    	count = dbPro.getArticleCount(searchWhat, searchText);

        if (count > 0) {
            // 검색 목록이 하나라도 존재한다면 리스트 출력
            articleList = dbPro.getArticles(searchWhat, searchText, startRow, endRow);
        }
    }

    number = count - (currentPage - 1) * pageSize + 1;
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/community.css">
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
    <section class="section community list">
        <div class="container">
            <div class="inner container-960">
                <table class="table is-fullwidth is-hoverable">
                    <colgroup>
                        <col width="60">
                        <col width="">
                        <col width="120">
                        <col width="170">
                        <col width="80">
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
                    if (count == 0) { // 글이 없을 경우
                %>

                    <tr>
                        <td colspan="5" class="none">게시판에 저장된 글이 없습니다.</td>
                    </tr>
                </table>

                <% // 글이 없을 경우
                    } else { // 글이 있을 경우
                    	for (int i = 0; i < articleList.size(); i++) {
                    		Board_FreeVO article = (Board_FreeVO) articleList.get(i);
                %>
                    <tr>
                        <td><%=article.getfNum()%></td>
                        <td><a href="content.jsp?num=<%=article.getfNum()%>&pageNum=<%=currentPage%>">
                        <%=article.getfTitle() %></a></td>
                        <td><%=article.getfWriter()%></td>
                        <td><%=sdf.format(article.getfDate())%></td>
                        <td><%=article.getfReadCount()%></td>
                    </tr>

                <%
                    }
                %>
        
            </table>
        
            <%
                } // 글이 있을 경우
            %>

            <div class="buttons is-right">
                <a href="writeForm.jsp" class="button is-success write">글쓰기</a>
            </div>
                
            <%
                if (count > 0) {
                    int pageBlock = 2;
                    int imsi = count % pageSize == 0 ? 0 : 1;
                    int pageCount = count / pageSize + imsi;

                    int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
                    int endPage = startPage + pageBlock - 1;

                    if (endPage > pageCount) endPage = pageCount;
            %>
            <div class="paging field">
                <div class="buttons has-addons is-centered">
                    <% if (startPage > pageBlock) { %>
                        <%
                            if (searchText == null) {
                        %>
                            <a href="list.jsp?pageNum=<%=startPage - pageBlock%>" class="button prev">이전</a>
                        <%
                            } else {
                        %>
                            <a href="list.jsp?pageNum=<%=startPage - pageBlock%>&searchText=<%=searchText%>" class="button prev">이전</a>
                        <%
                            }
                        %>
                    <% } %>

                    <%
                        for (int i = startPage; i <= endPage; i++) {
                            if (searchText == null) {
                                if (i == currentPage) {
                    %>
                                    <a href="list.jsp?pageNum=<%=i%>" class="button is-selected"><%=i %></a>
                    <%
                                } else {
                    %>
                                    <a href="list.jsp?pageNum=<%=i%>" class="button"><%=i %></a>
                    <%
                                }
                            } else {
                                if (i == currentPage) {
                    %>
                                    <a href="list.jsp?pageNum=<%=i%>&searchText=<%=searchText%>" class="button is-selected"><%=i %></a>
                    <%
                                } else {
                    %>
                                    <a href="list.jsp?pageNum=<%=i%>&searchText=<%=searchText%>" class="button"><%=i %></a>
                    <%
                                }
                            }
                        }
                    %>

                    <% if (endPage < pageCount) { %>
                        <%
                            if (searchText == null) {
                        %>
                            <a href="list.jsp?pageNum=<%=startPage + pageBlock%>" class="button next">다음</a>
                        <%
                            } else {
                        %>
                            <a href="list.jsp?pageNum=<%=startPage + pageBlock%>&searchText=<%=searchText%>" class="button next">다음</a>
                        <%
                            }
                        %>
                    <% } %>
                </div>
            </div>
            <%
                }
            %>

                
                <!-- 검색창 -->
                <form action="list.jsp">
                    <div class="field has-addons has-addons-centered search">
                    <span class="select">
                        <select name="searchWhat">
                            <option value="fWriter">작성자</option>    
                            <option value="fTitle">제목</option>  
                            <option value="fContents">내용</option>                          
                        </select>
                     </span>
                        <p class="control">
                            <input class="input" type="text" name="searchText" placeholder="검색어를 입력하세요">
                        </p>
                        <p class="control">
                            <button class="button" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <%@ include file="/include/footer.jsp" %>
</body>
</html>
