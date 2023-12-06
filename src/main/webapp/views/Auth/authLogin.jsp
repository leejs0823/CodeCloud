<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>

    <div class="authWrapper">
        <form class="authForm" action="path/to/your/loginServlet" method="POST">
        <img class="login_logo" src="../../resources/images/cc_login_logo.png" alt="logo">
            <div class="authText">단체만의 맞춤형 기술블로그,<br/>
<span class="authHilightText">CODE CLOUD</span>가 만들어드립니다!</div> <!-- AuthLoginTitle에 해당하는 부분 -->

            <div class="authInputWrapper">
                <input type="text" class="authInput" name="email" placeholder="이메일" onchange="handleInputChange(this)">
                <input type="password" class="authInput" name="pwd" placeholder="비밀번호" onchange="handleInputChange(this)">
            </div>

            <div class="authButtonWrapper">
                <button class="authButton" type="submit">Code Cloud에 로그인</button>

                <div class="underButtonTextWrapper">
                    <span class="underButtonText" onclick="location.href='/auth/create'">회원 가입</span> | 
                    <span class="underButtonText" onclick="location.href='/auth/reset'"> 비밀번호 초기화</span>
                </div>
            </div>
        </form>
    </div>

    <script>
        // 클라이언트 사이드 JavaScript 로직
        function handleInputChange(element) {
            // 입력 필드 값 변경 시 필요한 로직
        }
    </script>

</body>