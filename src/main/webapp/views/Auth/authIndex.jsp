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
<%--    회원가입 누를시 회원가입 페이지--%>
    <%--푸터--%>
    <%@ include file="../../views/layout/layoutFooter.jsp" %>


    <%--js--%>
    <script src="./resources/common/main_script.js"></script>
</body>
</html>
