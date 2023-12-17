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
    <!-- modal CSS -->
    <link rel="stylesheet" type="text/css" href="../../resources/css/modal.css">
</head>
 <style>
		
        /* 추가적인 스타일링 */
    </style>
<body>
    <%--헤더--%>
    <%@ include file="../../views/layout/layoutNavbar.jsp" %>

<%--    처음에는 로그인 페이지--%>
    <%@ include file="./authLogin.jsp" %>

    <%--푸터--%>
    <%@ include file="../../views/layout/layoutFooter.jsp" %>
    
        <!-- 모달 추가 -->
    <div id="modal" class="modal-overlay">
        <div class="modal-content">
            <p class="modal-text">여기에 메시지가 표시됩니다.</p>
            <div class="modal-button-container">
                <button class="modal-button" onclick="closeModal()">확인</button>
            </div>
        </div>
    </div>

   <script>
   // 모달 열기 
        function showModal(message) {
            document.querySelector('.modal-content p').textContent = message;
            document.getElementById('modal').style.display = 'flex';
        }
		// 모달 닫기 
        function closeModal() {
            document.getElementById('modal').style.display = 'none';
        }

        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            
            if (urlParams.has('error')) {
                showModal('로그인 실패');
            }

            if(urlParams.has('repeat')){
                showModal("회원가입 실패 : 중복된 계정입니다.");
            }

            if(urlParams.has('aceept')){
                showModal("회원가입 실패 : 중복된 계정입니다.");
            }
            if (urlParams.has('signup')) {
                showModal("회원가입 완료! 로그인을 시도해주세요.");
            }
        };
    </script>
    
</body>
</html>
