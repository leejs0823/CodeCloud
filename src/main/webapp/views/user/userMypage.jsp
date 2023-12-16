<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>CodeCloud</title>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="../../resources/css/main/main.css" />
<link rel="stylesheet" type="text/css"
	href="../../resources/css/layout/layout.css" />
<link rel="stylesheet" type="text/css"
	href="../../resources/css/user/mypage.css" />


</head>
<body>

	<%--헤더--%>
	<%@ include file="../../views/layout/layoutNavbar.jsp"%>
	<%-- 처음에는 로그인 페이지--%>
	<%-- 회원가입 누를시 회원가입 페이지--%>



	<!-- baaner -->
	<div class="ProfileWrapper">
		<!-- banner -->
		<div class="ProfileBannerWrapper">
			<div class="ProfileBannerContainer">
				<img class="mypageBanner cloudImg"
					src="../../resources/images/cc_login_logo.png" alt="logo" />
				<img class="mypageBanner backgroundImg"
					src="../../resources/images/login_background.png" alt="logo" />
				<img class="mypageBanner codeImg"
					src="../../resources/images/login_banner_code.png" alt="logo" />

				<img class="mypageBanner chatImg"
					src="../../resources/images/login_banner_chat.png" alt="logo" />
			</div>
		</div>

		<!-- // MYPAGE PRFOILE TITLE WRAPPER-->
		<div class="ProfileTitleWrapper">
			<div class="profileTitleContainer">
				<div class="profileTitleText">MYPAGE</div>
				<h2 class="profileNameText">000님, 안녕하세요!</h2>
				<span class="profileContentText"> 블라블 </span>
			</div>

			<div class="profileLogout" onclick="logout()">로그아웃</div>
			<!-- content -->
		</div>

		<div class="ProfileTileWrapper">
			<div class="ProfileTile">
				<img class="profileTileIcon"
					src="../../resources/images/group_icon.png" alt="group" />
				<div class="profileTileText">내가 속한 단체</div>
			</div>
			<div class="ProfileTile">
				<img class="profileTileIcon2"
					src="../../resources/images/like_icon.png" alt="group" />
				<div class="profileTileText">좋아요한 게시물</div>
			</div>
			<div class="ProfileTile">
				<img class="profileTileIcon2"
					src="../../resources/images/post_icon.png" alt="group" />
				<div class="profileTileText">작성한 게시물</div>
			</div>
			<div class="ProfileTile">
				<img class="profileTileIcon2"
					src="../../resources/images/setting_icon.png" alt="group" />
				<div class="profileTileText">정보 수정</div>
			</div>
		</div>
	</div>


	<!-- profile wrapper -->






	<%--푸터--%>
	<%@ include file="../../views/layout/layoutFooter.jsp"%>
	<%--js--%>

	<script>
		function logout() {
			var form = document.createElement('form');
			form.method = 'POST';
			form.action = '${pageContext.request.contextPath}/authLogout';
			document.body.appendChild(form);
			form.submit();
		}
		// window 로드시 로그인여부 확인 ,로그인 정보가 세션에 없으면 index.jsp로이동 
		window.onload = function() {
	<%session = request.getSession(false); // Get session without creating a new one
if (session == null || session.getAttribute("user") == null) { // Check if "user" attribute is not set%>
		window.location.href = "../../index.jsp"; // Redirect to index.jsp
	<%}%>
		};
	</script>
</body>
</html>
