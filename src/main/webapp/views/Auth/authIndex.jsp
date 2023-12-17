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

<%--    처음에는 로그인 페이지--%>
    <%@ include file="./authLogin.jsp" %>

    <%--푸터--%>
    <%@ include file="../../views/layout/layoutFooter.jsp" %>
    <%
   	// url Params 파라미터 가지고 와서 error turel이면 에러 창 띄우기  
   	// signup true이면 회원가입 완료 창 띄우
    %>



<script>
    window.onload = function() {
        
        var urlParams = new URLSearchParams(window.location.search);

        
        if (urlParams.has('error')) {
            alert('로그인 실패');
        }
        
        if(urlParams.has('repeat')){
        	alert("회원가입 실패 : 중복된 계정입니다."")
        }

        
        if (urlParams.has('signup')) {
            alert("회원가입 완료! 로그인을 시도해주세요.");
        }
    };
</script>
    <%--js--%>
    <script src="./resources/js/auth/authLogin.js"></script>
</body>
</html>
