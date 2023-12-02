<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>환영합니다 - 내 블로그</title>
    <style>
    </style>
        <link rel="stylesheet" type="text/css" href="./resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="./resources/css/layout/layoutNavbar.css">
    <link rel="stylesheet" type="text/css" href="./resources/css/layout/layoutFooter.css">


</head>
<body>
<header>
    <%@ include file="./views/layout/layoutNavbar.jsp" %>
</header>

        <div class="container">
            <h2>환영합니다!</h2>
            <p>Code Cloud!</p>
        </div>

<footer>
    <%@ include file="./views/layout/layoutFooter.jsp" %>
</footer>
        <script src="./resources/common/main_script.js"></script>
   
</body>
</html>
