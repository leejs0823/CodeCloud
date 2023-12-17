<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>Code Cloud</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postDetail.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

	<div class="postWrapper">
		<div class="postForm">
	      <h1> 디테일 곧 할 거라우 </h1>
	     <form action="${pageContext.request.contextPath}/registrationsuccess" method="post">
		         <div class="postInputWrapper">
							<input class="titleInput" type="text" placeholder="제목" name="groupName" >
							<textarea class="contentInput" name="description" placeholder="내용을 입력해주세요" oninput="calcTextareaHeight(this)" ></textarea>
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