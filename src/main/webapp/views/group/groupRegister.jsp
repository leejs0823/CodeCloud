<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>단체 등록하기</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/layout/layout.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/group/groupRegister.css">
</head>
<body>
	<script>
	    function autoSizeInput(element) {
	        element.style.height = 'auto';
	        element.style.height = (element.scrollHeight) + 'px';
	    }
	    
	    window.onload = function() {
	        autoSizeInput(document.getElementById('nameinput'));
	        autoSizeInput(document.getElementById('descriptioninput'));
	    }
	    
	    function triggerFileInput() {
	        document.getElementById('groupImage').click();
	    }
	</script>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

	<div class="groupregister-container">
	    <div class="groupregister-header">   
	      <h1> 단체 등록하기 </h1>
	      <p> 단체만의 맞춤형 기술블로그, <span class="blue-text">CODE CLOUD</span>가 만들어드립니다! </p>
	     </div>
	     <div class="groupregister-body">
			<div class="groupregister-image" onclick="triggerFileInput()">
			    <img src="../../resources/images/group/groupImage.png" id="groupImageDisplay" style="cursor: pointer;">
			    <input type="file" name="groupImage" id="groupImage" accept="image/*" style="display: none;">
			</div>
		         <div class="groupregister-info">
			         <form action="groupRegisterResult.jsp" method="post">
			         	<div class="groupregister-text">
							<h3>단체명</h3>
							<input id="nameinput" type="text" name="groupName" oninput="autoSizeInput(this)">
							<h3 id="description">단체 소개</h3>
							<input id="descriptioninput" type="text" name="description" oninput="autoSizeInput(this)">
						</div>
						<button class="groupregisterButton" type="submit">단체 신청</button>
			         </form>
		         </div>
		         <!-- 공개 설정 : 후순위 기능 -->
	      </div>
	</div>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
    <%--js--%>
    <script src="./resources/common/main_script.js"></script>
</body>
</html>