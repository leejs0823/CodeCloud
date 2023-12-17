<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Post" %>
<%@ page import= "dao.PostDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세 페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postDetail.css">
</head>
<body>
<%
	int postId = 0;
	String postIdParam = request.getParameter("postId");
	if (postIdParam != null && !postIdParam.isEmpty()) {
	    postId = Integer.parseInt(postIdParam);
	}

    PostDAO postDAO = new PostDAO();
    Post post = postDAO.getPostById(postId);
%>
    <div class="post-details-container">
        <h1><%= post.getTitle() %></h1>
        <p><%= post.getContent() %></p>
        <p>작성자: <%= post.getWriter() %></p>
        <p>작성일시: <%= post.getCreatedAt() %></p>
    </div>
</body>
</html>
