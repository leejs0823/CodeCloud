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
	    <form class="signUpInputContainer" action="/auth/signup" method="POST">
	    <div class="authSignUpText">회원 가입</div>
	        <!-- 이메일 입력 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">*이메일</h2>
	            <input class="signUpInput" type="email" name="email" placeholder="이메일을 입력해주세요." required>
	            <div id="emailValidationMessage" class="validationMessage"></div>
	        </div>
	
	        <!-- 비밀번호 입력 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">*비밀번호</h2>
	            <input class="signUpInput" type="password" name="pwd" placeholder="비밀번호" required>
	            <div id="passwordValidationMessage" class="validationMessage"></div>
	        </div>
	
	        <!-- 비밀번호 확인 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">*비밀번호 확인</h2>
	            <input class="signUpInput" type="password" name="confirmPwd" placeholder="비밀번호 확인" required>
	            <div id="confirmPasswordValidationMessage" class="validationMessage"></div>
	            
	        </div>
	        
	        <!-- 닉네임 입력 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">*닉네임</h2>
	            <input class="signUpInput" type="text" name="nickname" placeholder="닉네임을 입력해주세요." required>
	        </div>
	
	        <!-- 한줄소개 -->
	        <div class="signUpInputWrapper">
	            <h2 class="signUpInputTitleText">한줄소개</h2>
	            <input class="signUpInput" type="text" name="introduce" placeholder="한줄소개를 입력해주세요.">
	        </div>
	
	        <!-- 가입하기 버튼 -->
	        <button class="authSignUpButton" type="submit">가입하기</button>
	    </form>
	
	    <%--푸터--%>
	    <%@ include file="../../views/layout/layoutFooter.jsp" %>
	
	    <%--js--%>
	    <script src="../../resources/js/auth/authSignUp.js"></script>
</body>
</html>
