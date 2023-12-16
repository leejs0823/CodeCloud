<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeCloud</title>
    <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/main/main.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/layout/layout.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/auth/auth.css">
</head>
<body>
	    <%--헤더--%>
	    <%@ include file="../../views/layout/layoutNavbar.jsp" %>
	    
	    <!-- 회원가입 폼 -->
	    <form class="signUpInputContainer" action="${pageContext.request.contextPath}/signup" method="POST">
	    <div class="authSignUpText">정보 수정</div>
	        <!-- 이메일 입력 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">이메일(수정불가)</h2>
	            <input class="signUpInput" type="email" name="email" placeholder="이메일을 입력해주세요." disabled>
	            <div id="emailValidationMessage" class="validationMessage"></div>
	        </div>
	        
	        <!-- 닉네임 입력 -->
	        <div class="signUpInputWrapper">
    <h2 class="signUpInputTitleText">*닉네임</h2>
    <%
        // Check if the user is stored in the session and get the nickname
        String nickname = "";
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            nickname = user.getNickname(); // Assuming 'getNickname' method exists in your User class
        }
    %>
    <input class="signUpInput" type="text" name="nickname" placeholder="닉네임을 입력해주세요." required value="<%= nickname %>">
	        </div>
	
	        <!-- 한줄소개 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">한줄소개</h2>
	                <%
        // Check if the user is stored in the session and get the nickname
        String description = "";
        if (session.getAttribute("description") != null) {
            user = (User) session.getAttribute("description");
            description = user.getDescription(); // Assuming 'getNickname' method exists in your User class
        }
    %>
	            <input class="signUpInput" type="text" name="description" value = "<%=description %> placeholder="한줄소개를 입력해주세요.">
	        </div>
	
	        <!-- 가입하기 버튼 -->
		<button class="authSignUpButton" type="submit">수정하기</button>
	</form>
	
	    <%--푸터--%>
	    <%@ include file="../../views/layout/layoutFooter.jsp" %>
	
	    <%--js--%>
	    <script src="../../resources/js/auth/authSignUp.js"></script>
</body>
</html>
