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
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
	<div id="banner">
		<img src="../../resources/images/main_banner.png">
	</div>
	
	<main>
		<div id="bar">
			<div id="sortbar">
				<ul>
               	 	<li class="current"><a href="">게시물</a></li>
               	 	<li><a href="">불로그</a></li>
           		</ul>
			</div>
			<div id="searchbar">
				<div style="background-color:gray;">
				</div>
			</div>
		</div>
		<div>
		</div>
	</main>

    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="./resources/common/main_script.js"></script>
</body>
</html>