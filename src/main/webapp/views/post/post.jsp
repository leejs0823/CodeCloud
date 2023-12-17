<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.PostDAO" %>
<%@ page import="model.Group" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>Code Cloud</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/post.css">
</head>
<body>	
<%--     <%
        Long userId = (Long) session.getAttribute("userId");
        PostDAO postDAO = new PostDAO();
        List<Group> groups = new ArrayList<>();
        
        if (userId != null) {
            try {
                groups = postDAO.getGroupsByUserId(userId);
            } catch (SQLException e) {
                e.printStackTrace(); // 오류 처리
                // 오류 페이지나 메시지를 표시할 수 있습니다.
            }
        } else {
            // userId가 없으면 로그인 페이지로 리다이렉트
            response.sendRedirect("login.jsp");
            return;
        }
    %> --%>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

	<div class="postWrapper">
		<div class="postForm">
	      <h1> 글 작성하기 </h1>
	     <form action="${pageContext.request.contextPath}/post" method="post">
		         <div class="postInputWrapper">
							<input class="titleInput" type="text" placeholder="제목" name="title" >
							<textarea class="contentInput" name="content" placeholder="내용을 입력해주세요" oninput="calcTextareaHeight(this)" ></textarea>
						<button class="postSendButton" type="submit">게시하기</button>
		         </div>
		  </form>
	      </div>
	</div>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
    <%--js--%>
    <script src="${pageContext.request.contextPath}/resources/js/main_script.js"></script>
</body>
</html>