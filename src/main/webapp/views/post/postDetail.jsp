<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Post" %>
<%@ page import="dao.PostDAO" %>
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
        if (postIdParam != null && !postIdParam.isEmpty()) {
            postId = Integer.parseInt(postIdParam);
        }
        
        PostDAO postDAO = new PostDAO();
        
        Post post = postDAO.getPostById(postId);
        String groupName = postDAO.findGroupNameByPostId(postId);
        
       
        
        if (post == null) {
            // 게시물이 없으면 404 페이지로 리디렉트
            response.sendRedirect("${pageContext.request.contextPath}/notFound.jsp");
            return;
        }
    %>
    <div class="detailPageWrapper">
	    <div class="DetailPageType">
	   <!-- 서버에서 단체 이름 불러오기  -->
	    ${groupName}
	    </div>
	    <div class="DetailTitleWrapper">
		    <div class="DetailTitle"> <%= post.getTitle() %></div>
<!-- 		    삭제 수정, .. 아이콘 들어갈 -->
		    	<div class="DetailTitleIconWrapper">
		    	</div>
	    </div>
	    
	    <div class="DetailTitleInfoWrapper">
		    <p class ="DetailTitleGrayInfo"> 작성자 : <%= post.getWriter() %> </p>
		    <p class ="DetailTitleGrayInfo"><%= post.getCreatedAt() %></p>
	    
	    </div>
	    <div class="DetailContentWrapper">
	    	<p class="DetailContent"><%= post.getContent() %></p>
	    </div>
	    
	    <hr class="DetailDiviner"/>
	    <div class="LikeViewWrapper">
		   <p class="DetailViewText"> 조회수 :</p>
		   <p class="DetailViewText"> 좋아요 :</p>  
	    </div>
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
    
    <!-- 댓글 목록 쭉보여주기  -->

    </div>
    
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>
    <%--js--%>
    <script src="${pageContext.request.contextPath}/resources/js/main_script.js"></script>
        <script>
        function submitComment() {
            var content = document.getElementById('commentContent').value;
            if (content === "") {
                alert("댓글을 입력해주세요.");
                return;
            }
            // Add AJAX call to submit the comment
        }
    </script>
</body>
</html>
