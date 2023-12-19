<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Post" %>
<%@ page import="dao.PostDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>Code Cloud</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postEdit.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
    <%
        int postId = Integer.parseInt(request.getParameter("postId"));
        PostDAO postDAO = new PostDAO();
        Post post = postDAO.getPostById(postId);
    %>
	<div class="postWrapper">
		<div class="postForm">
			<h1> 글 수정하기 </h1>
			    <form action="${pageContext.request.contextPath}/postEdit" method="post">
			   		<div class="postInputWrapper">
				        <input type="hidden" name="postId" value="<%= postId %>">
				        <input class="titleInput" type="text" name="title" value="<%= post.getTitle() %>"><br>
				        <textarea class="contentInput" name="content"><%= post.getContent() %></textarea><br>
				        <button class="postSendButton" type="submit">수정하기</button>
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