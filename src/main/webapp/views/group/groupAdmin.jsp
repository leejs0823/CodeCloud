<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeCloud</title>
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/group/groupAdmin.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/layout/layout.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
	
	<%-- 그룹관리자 페이지 --%>
	<main>
	<div class="group_profile">
		<div class="photo">
			<div class="background_photo"></div>
			<div class="profile_photo"></div>
		</div>
		<div>
			<p class = "group_name">단체명</p>
			<p class = "group_description">단체 소개 글 나오는 부분입니다.</p>
			<button type="button" class = "profile_edit" onClick= "location.href = '/CodeCloud/views/group/groupAdminEdit.jsp'">프로필 편집</button>
		</div>
	</div>
	</main>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="/CodeCloud/resources/js/group/groupDetail.js"></script>
</body>
</html>
