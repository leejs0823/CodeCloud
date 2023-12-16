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
	<script>
		// 설명 textarea 늘리기
		const DEFAULT_HEIGHT = 30;
	
		const $textarea = document.querySelector('#descriptioninput');
	
		$textarea.oninput = (event) => {
		  const $target = event.target;
	
		  $target.style.height = 0;
		  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
		};
	</script>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

	<div class="postWrapper">
		<div class="postForm">
	      <h1> 글 작성하기 </h1>
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