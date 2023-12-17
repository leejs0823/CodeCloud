<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Post" %>
<%@ page import="dao.PostDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Detail</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postDetail.css">
</head>
<body>
    <%@ include file="../layout/layoutNavbar.jsp" %>
    <%
        int postId = 0;
        String postIdParam = request.getParameter("postId");
        if (postIdParam != null && !postIdParam.isEmpty()) {
            postId = Integer.parseInt(postIdParam);
        }
        
        PostDAO postDAO = new PostDAO();
        Post post = postDAO.getPostById(postId);
        
        if (post == null) {
            // 게시물이 없으면 404 페이지로 리디렉트
            response.sendRedirect("${pageContext.request.contextPath}/path-to-404-page.jsp");
            return;
        }
    %>
    <div class="postdetailWrapper">
        <h1><%= post.getTitle() %></h1>
        <p><%= post.getContent() %></p>
        <p>작성자: <%= post.getWriter() %></p>
        <p>작성일시: <%= post.getCreatedAt() %></p>
    </div>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
    <%--js--%>
    <script src="${pageContext.request.contextPath}/resources/js/main_script.js"></script>
</body>
</html>
