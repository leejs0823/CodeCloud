<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeCloud</title>
        <link rel="stylesheet" type="text/css" href="./resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="./resources/css/main/main.css">
        <link rel="stylesheet" type="text/css" href="./resources/css/layout/layout.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="./views/layout/layoutNavbar.jsp" %>

    <%--메인--%>
    <%@ include file="./views/main/main.jsp" %>

    <%--푸터--%>
    <%@ include file="./views/layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="/CodeCloud/resources/js/main/mainDetail.js"></script>
</body>
</html>
