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
	<div id="banner">
		<img src="/CodeCloud/resources/images/main_banner.png">
	</div>
	<main>
		<div id="bar">
			<div id="selectbar">
				<ul>
               	 	<li ><a id ="post_category" class="selected" onclick="loadPage('./views/main/mainPost.jsp'); select('post_category')">게시물</a></li>
               	 	<li><a id="group_category" onclick="loadPage('./views/main/mainGroup.jsp'); select('group_category')">단체</a></li>
           		</ul>
			</div>
			<div id="searchbar">
				<div>
				<form>
					<input type="text" name="search" value="검색어를 입력하세요."/>
					<input type="submit" value="검색"/>
				</form>
				</div>
			</div>
		</div>
		<div id="sort">
			<p>최신순</p>
			<a><img src="/CodeCloud/resources/images/icons/down_icon.png"></a>
		</div>
		<div id = "content">
			<%@ include file="./mainPost.jsp" %>
		</div>
	</main>

    <%--js--%>
    <script src="../../resources/js/main/mainDetail.js"></script>
</body>
</html>