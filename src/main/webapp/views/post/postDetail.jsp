<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Post" %>
<%@ page import="dao.PostDAO" %>
<%@ page import="dao.GroupDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Detail</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout/layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postDetail.css">
</head>
<body>
    <%@ include file="../layout/layoutNavbar.jsp" %>
    <%
        int postId = 0;
        String postIdParam = request.getParameter("postId");
        
        PostDAO postDAO = new PostDAO();
        
        if (postIdParam != null && !postIdParam.isEmpty()) {
            postId = Integer.parseInt(postIdParam);
            postDAO.addViewCnt(postId);
        }
        
        
        
        Post post = postDAO.getPostById(postId);
        String groupName = postDAO.findGroupNameByPostId(postId);
        
        if (post == null) {
            // 게시물이 없으면 404 페이지로 리디렉트
            response.sendRedirect("${pageContext.request.contextPath}/notFound.jsp");
            return;
        }
        GroupDAO groupDAO = new GroupDAO();
        String writerName = groupDAO.getUserById(post.getWriter());
    %>
    <div class="detailPageWrapper">
	    <div class="DetailPageType">
	   <!-- 서버에서 단체 이름 불러오기  -->
	   <p style="font-size:1.5rem">
	   <%= groupName %>
	   
	   </p>
	    
	    </div>
	    <div class="DetailTitleWrapper">
		    <div class="DetailTitle"> <%= post.getTitle() %></div>
<!-- 		    삭제 수정, .. 아이콘 들어갈 -->
		    	<div class="DetailTitleIconWrapper">
		    	</div>
	    </div>
	    
	    <div class="DetailTitleInfoWrapper">
		    <p class ="DetailTitleGrayInfo"> 작성자 : <%= writerName %> </p>
		    <p class ="DetailTitleGrayInfo"><%= post.getCreatedAt() %></p>
	    
	    </div>
	    <div class="DetailContentWrapper">
	    	<p class="DetailContent"><%= post.getContent() %></p>
	    </div>
	    <hr class="DetailDiviner"/>
	    
	    <div class="summarizeWrapper">
	    <div class="summarizeBtn" onclick="summarizeText()">내용 요약하기</div>
	    
	    </div>
	    <div id="loading" class="loading-overlay">
	    
    	<div class="loading-spinner">
    	</div>
<!--     	<div class="LoadingText">
	    	요약 중입니다 잠시만 기다려주세요!
	    </div> -->
		</div>
	    <div id="summary">
	    
	    
	    </div>

	    <hr class="DetailDiviner"/>
	    <div class="LikeViewWrapper">
	    
		   <p class="DetailViewText"> 조회수 : <%= post.getViewCnt() %></p>
		   
		<div class="Like" onclick="toggleLike()">
        	<img class="LikeButton" src="../../resources/images/likebutton.png" alt="like" style="width: 30%;"  />
        </div>
		<p class="DetailViewText"> 좋아요 : <span id="likeCount"><%= post.getLikeCnt() %></span></p>

	    </div>
	    <%--
        <div class="DetailCommentHeader">답변 댓글수</div>
        <!-- 입력창  -->
        <!-- 유저 로그인에 따라 인풋장 나누기  -->
            <% 
        user = (User) session.getAttribute("user"); 
        if (user != null) {
    %>
        <!-- Comment Input for Logged-in Users -->
        <div class="DetailCommentInputWrapper">
            <input type="text" class="DetailCommentInput" placeholder="답변을 작성해보세요 !" id="commentContent">
            <button class="DetailCommentButton" onclick="submitComment()">등록</button>
        </div>
    <% 
        } else { 
    %>
        <!-- Prompt for Non-logged-in Users -->
        <div class="DetailCommentInputWrapper" onclick="location.href='/CodeCloud/views/Auth/authIndex.jsp'">
            <input type="text" class="DetailCommentInput" placeholder="커뮤니티는 로그인 후 댓글을 작성할 수 있습니다." disabled>
            <button class="DetailCommentButton">로그인</button>
        </div>
    <% 
        } 
    %>
    
    

    
    <!-- 댓글 목록 쭉보여주기  --> --%>

    </div>
    
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
   <script>
   // 좋아요
   function toggleLike() {
       var xhr = new XMLHttpRequest();
       // 서블릿 URL 확인 및 수정
       xhr.open("GET", "${pageContext.request.contextPath}/likeServlet?postId=" + <%= postId %>, true);
       xhr.onreadystatechange = function() {
           if (this.readyState == 4 && this.status == 200) {
               // 좋아요 수 업데이트
               document.getElementById("likeCount").innerText = this.responseText;
           } else {
               // 오류 처리
               console.error("서버 오류 발생: 상태 코드 " + this.status);
           }
       };
       xhr.send();
   }
   
   function summarizeText() {
	    // 로딩 창 표시
	    var loadingOverlay = document.getElementById("loading");
	    loadingOverlay.style.display = "block";

	    var text = `<%= post.getContent() %>`;
	    var summaryDiv = document.getElementById("summary");
	    summaryDiv.innerText = ""; // 요약 내용이 담길 div를 초기화

	    var xhr = new XMLHttpRequest();
	    xhr.open("POST", "${pageContext.request.contextPath}/summarizeText", true);
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.onreadystatechange = function() {
	        if (this.readyState == 4 && this.status == 200) {
	            // 로딩 창 숨김
	            loadingOverlay.style.display = "none";

	            var responseData = JSON.parse(this.responseText);
	            var content = responseData.choices[0].message.content;
	            console.log(content);
	            animateText(content, 0, "summary");
	        }
	    };
	    xhr.send("textToSummarize=" + encodeURIComponent(text));
	}



	// 텍스트 애니메이션 함수
function animateText(text, index, elementId) {
    if (index < text.length) {
        // 현재 문자가 공백 문자인 경우 추가된 공백을 유지
        console.log(text.charAt(index))
        if (text.charAt(index) === ' ') {
        	console.log("으아아아ㅏㅇ");
            document.getElementById(elementId).innerHTML += '&nbsp;';
        } else {
            document.getElementById(elementId).innerText += text.charAt(index);
        }
        
        setTimeout(function() {
            animateText(text, index + 1, elementId);
        }, 50); // 글자 표시 간격 조정 가능
    }
}


</script>
   
        <script>
        function submitComment() {
            var content = document.getElementById('commentContent').value;
            if (content === "") {
                alert("댓글을 입력해주세요.");
                return;
            }
        }
        
        
        window.onload = function() {
        console.log("aaa");
        
        };
        
        function toggleLike() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "${pageContext.request.contextPath}/likeServlt?postId=" + <%= postId %>, true);
            xhr.onreadystatechange = function() {
                if (this.readyState == 4) {
                    if (this.status == 200) {
                        document.getElementById("likeCount").innerText = this.responseText;
                    } else {
                        // 오류 상태에 따른 처리
                        console.error("서버 오류 발생: 상태 코드 " + this.status);
                        if (this.status == 404) {
                            console.error("404 Not Found: 서블릿 경로를 찾을 수 없습니다.");
                        } else if (this.status == 500) {
                            console.error("500 Internal Server Error: 서버 내부 오류가 발생했습니다.");
                        } else if (this.status == 403) {
                            console.error("403 Forbidden: 접근 권한이 없습니다.");
                        } else {
                            console.error("알 수 없는 오류: " + this.statusText);
                        }
                    }
                }
            };
            xhr.send();
        }

    </script>
</body>
</html>
