<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>Code Cloud</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/group/groupRegister.css">
</head>
<body>
	<script>
		// 설명 textarea 늘리기
		const DEFAULT_HEIGHT = 30;
	
		const $textarea = document.querySelector('#descriptioninput');
	
		$textarea.oninput = (event) => {
		  const $target = event.target;
	
		  $target.style.height = 0;
		  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
		};
		<%--
		// 배경 사진 선택 시 이미지 업로드
	    function triggerFileInput() {
	        document.getElementById('groupImage').click();
	    }
		
		 // 선택한 이미지를 미리보기로 표시하는 함수
		    function setImage(event) {
		        const selectedFile = event.target.files[0];
		        const imageDisplay = document.getElementById('groupImageDisplay');
		        const imageButtons = document.getElementById('imageButtons');
	
		        if (selectedFile) {
		            const reader = new FileReader();
	
		            reader.onload = function(event) {
		                imageDisplay.src = event.target.result;
		                imageButtons.style.display = 'block'; 
		            };
	
		            reader.readAsDataURL(selectedFile);
		        }
		    }
	
		    document.getElementById('groupImage').addEventListener('change', displaySelectedImage);
		    --%>
	</script>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

	<div class="groupregister-container">
	    <div class="groupregister-header">   
	      <h1> 단체 등록하기 </h1>
	      <p> 단체만의 맞춤형 기술블로그, <span class="blue-text">CODE CLOUD</span>가 만들어드립니다! </p>
	      
	     </div>
	     <div class="groupregister-body">
	     <form action="${pageContext.request.contextPath}/registrationsuccess" method="post">
	     		<!-- 이미지 업로드 구현-->
	     		<!-- 
				<div class="groupregister-image" onclick="triggerFileInput()">
					<img src="${pageContext.request.contextPath}/resources/images/group/groupImage.png" id="groupImageDisplay" style="cursor: pointer;">
				    <input type="file" name="groupImage" id="groupImage" accept="image/*" style="display: none;" onchange="setImage(event)">
				    <div id="imageButtons" style="display: none;">
				    	<button class="imageUpdateButton" onclick="updateImage()">수정하기</button>
				        <button class="imageDeleteButton" onclick="deleteImage()">삭제하기</button>
    				</div>
				</div>
				-->
				<!-- 단체 정보 입력 -->
		         <div class="groupregister-info">
			         	<div class="groupregister-text">
							<h3>단체명</h3>
							<input class="nameInput" type="text" name="groupName" placeholder="최대 30자" >
							<h3>단체 소개</h3>
							<textarea class="descriptionInput" name="description" placeholder="최대 100자" oninput="calcTextareaHeight(this)" ></textarea>
						</div>
						<button class="groupregisterButton" type="submit">단체 신청</button>
		         </div>
		         <!-- 공개 설정 : 후순위 기능 -->
		  </form>
	      </div>
	</div>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
    <%--js--%>
    <script src="${pageContext.request.contextPath}/resources/js/main_script.js"></script>
</body>
</html>