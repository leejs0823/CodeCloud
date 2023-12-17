<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeCloud</title>
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/group/joinGroup.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/layout/layout.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>

    <main>
    	<div class="joinGroup_header">
			<h1>단체 참여하기</h1>
		</div>
    	<div class="group_profile">
    		<div class="group_photo"></div>
    		<p class="group_name">단체명</p>
    		<div class="group_total_member">
    			<p>total member : </p>
    			<p>00명</p>
    		</div>
    		<div class="group_description">
    			<p>안녕하세요 코드클라우드 입니다! 단체만의 맞춤형 블로그를 만들어드립니다. </p>
    		</div>
    		<button class="join_button" onClick="checkSessionAndRedirect()">단체 참여</button>
    	</div>
    </main>

    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script>
    	
    	function checkSessionAndRedirect(){
    		var user = '${sessionScope.user}';
    		document.write(user);
    		if(user){
    			var isConfirmed = confirm("[단체명]에 가입하시겠습니까?");
    			if(isConfirmed){
    				/*가입로직 구현*/
    				alert("[단체에 가입되었습니다.");
    				window.location.href = "/CodeCloud/index.jsp";
    			}
    		}else{
    			redirectToLoginPage();
    		}
    	}
    	function redirectToLoginPage(){

    		alert("로그인을 먼저 진행해주세요!");
    		
    		var currentUrl = encodeURIComponent(window.location.href);
    		window.location.href = "/CodeCloud/views/Auth/authIndex.jsp?redirect=" + currentUrl;
    	}
    </script>
</body>
</html>
