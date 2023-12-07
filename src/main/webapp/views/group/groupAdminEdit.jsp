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
	
	<%-- 프로필 수정--%>
	<main>
		<div class="groupAdminEdit_header">
			<h1 >프로필 편집</h1>
		</div>
		<div class="photo">
			<div class="background_photo"></div>
			<div class="profile_edit">
				<div class="profile_photo"></div>
				<a href="#">프로필 사진 변경</a>
			</div>
		</div>
		<form>
		<div class = "description">
			<div class = "group_name_edit">
				<h2 class = "group_name">단체명</h2>
				<input class="new_name_input" type="text" maxlength=12 name="group_name" placeholder="단체명을 입력하세요."/>
			</div>
			<div class = "group_description_edit">
				<h2 class = "group_description">단체 소개</h2>
				<textarea class="new_description_input" maxlength=100 name="group_description"></textarea>
			</div>
			<input class="edit_button" type="submit" value="수정 완료" />
		</div>
		</form>
	</main>
	
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="/CodeCloud/resources/js/group/groupDetail.js"></script>
</body>
</html>