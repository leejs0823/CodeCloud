<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>CodeCloud</title>
        <link
            rel="stylesheet"
            type="text/css"
            href="../../resources/css/reset.css"
        />
        <link
            rel="stylesheet"
            type="text/css"
            href="../../resources/css/main/main.css"
        />
        <link
            rel="stylesheet"
            type="text/css"
            href="../../resources/css/layout/layout.css"
        />
        <link
            rel="stylesheet"
            type="text/css"
            href="../../resources/css/user/mypage.css"
        />
        
        	
    </head>
    <body>
                
        <%--헤더--%> <%@ include file="../../views/layout/layoutNavbar.jsp" %>
        <%-- 처음에는 로그인 페이지--%> <%-- 회원가입 누를시 회원가입 페이지--%>
        

            
            <!-- baaner -->
            <div class="ProfileWrapper">
            <!-- banner -->
			  <div class="ProfileBannerWrapper" >
			  <div class = "ProfileBannerContainer">
			  		<img
			                class="mypageBanner cloudImg"
			                src="../../resources/images/cc_login_logo.png"
			                alt="logo"
            					/>
            					            					<img
			                class="mypageBanner backgroundImg"
			                src="../../resources/images/login_background.png"
			                alt="logo"
            					/>
            					<img
			                class="mypageBanner codeImg"
			                src="../../resources/images/login_banner_code.png"
			                alt="logo"
            					/>

            					<img
			                class="mypageBanner chatImg"
			                src="../../resources/images/login_banner_chat.png"
			                alt="logo"
            					/> 		
            					</div>
			  </div>
			
			<!-- // MYPAGE -->
			<div class ="ProfileTitleWrapper">
				<div class="profileTitleContainer">
					<div class="profileTitleText">MYPAGE</div>
					<h2 class="profileNameText">
					000님, 안녕하세요!
					</h2>
					<span class="profileContentText">
					블라블
					</span>
				</div>
				
				<div class="profileLogout">
				로그아웃 
				</div>
				<!-- content -->
			</div>
			  
            
            </div> 
            
            
            <!-- profile wrapper -->
            

            
            
            
            
        <%--푸터--%> <%@ include file="../../views/layout/layoutFooter.jsp" %>
        <%--js--%>
        <script src="./resources/common/main_script.js"></script>
    </body>
</html>
