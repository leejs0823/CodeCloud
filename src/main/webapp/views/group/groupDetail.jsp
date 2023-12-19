<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<%@ page import="model.GroupMembership" %>
<%@ page import="dao.GroupDAO" %>
<%@ page import="model.User" %>
<%@ page import="dao.PostDAO" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeCloud</title>
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/reset.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/group/groupDetail.css">
        <link rel="stylesheet" type="text/css" href="/CodeCloud/resources/css/layout/layout.css">
</head>
<body>
    <%--헤더--%>
    <%@ include file="../layout/layoutNavbar.jsp" %>
	
	<%-- 그룹관리자 페이지 --%>
	<% 
	GroupDAO groupDAO = new GroupDAO();
	int x = 1;
	Long groupId = Long.valueOf(x);
	String groupIdParam = request.getParameter("groupId");
	if (groupIdParam != null && !groupIdParam.isEmpty()) {
		groupId = Long.valueOf(groupIdParam);
    }
	Group group = (Group)groupDAO.getGroupById(groupId);
	Long adminId = groupDAO.getLeaderId(groupId);
	String groupAdminName = groupDAO.getUserById(adminId);

	PostDAO postDAO = new PostDAO();
	List<Post> allGroupPosts = new ArrayList<>();
	allGroupPosts = postDAO.getPostsByGroupId(groupId);
	
	%>
	<main>
		<div class="background_photo"></div>
		<div class="profile">
			<div class="profile_edit">	
				<div class="profile_photo"></div>
				<h1 class="group_name"><%=group.getGroupName() %> </h1>
			</div>
			<p class = "group_description"><%=group.getDescription() %></p>
		</div>
		<div class="content">
		<div class="post_content">
			<h2>게시물</h2>
			<div class="container">
				<div class = "categories">
					<div class = "category" id = "category_all">전체</div>
					<div class = "category">카테고리 1</div>
					<div class = "category">카테고리 2</div>
				</div>
				<button class="post_button" type="submit">글 작성하기</button>
			</div>
			<div class="frame">
			<%
			
			for(Post post : allGroupPosts){
				if(post != null){
					int likeCnt = post.getLikeCnt();
					String content = post.getContent();
					String title = post.getTitle();
					String writer = groupDAO.getUserById(post.getWriter());
					
					
					%>
					<div class="post" >
						<div class="thumbnail"></div>
						<p class="post_title"><%=title %></p>
						
						<p class="detail">
						<c:set var="content" value="<%=content%>"/>
						<c:choose>
							<c:when test="${fn:length(content)>20}">
								${fn:substring(content, 0, 19)}...
							</c:when>
							<c:otherwise>
								${content}
							</c:otherwise>
						</c:choose>
						</p>
					<div class="writer_and_like">
						<div class="writer">
							<p><%=writer %> </p>
						</div>
						<div class="like">
							<p><%=likeCnt %></p>
							<img alt="heart" src="/CodeCloud/resources/images/icons/like_icon.png">
						</div>
					</div>
				</div>
				<%
				}
			}
			%>

		</div>
		<div class = "member_content">
			<h2>MEMBER</h2>
			<div class = "searchbar">
			<form>
				<input type = "text" class = "search_input" name = "keyword" placeholder = "이름 검색"/>
				<input type = "submit" class = "search_button" value = "검색"/>
			</form>
			</div>
			<div class = "member_list">
				<div class = "member">
					<div class = "member_name">
						<p><%=groupAdminName %></p>
						<div class = "admin">[관리자]</div>
					</div>
				</div>
				
				<%
				Long[] userIds = groupDAO.getUsersByGroupId(groupId);
				String userName = null;

				ArrayList<Long> userIdList = new ArrayList<>();
				for(Long userId : userIds){
					if(userId != null){
						userIdList.add(userId);
					}
				}
				for(Long userId : userIdList){
					userName = groupDAO.getUserById(userId);
				%>
				<div class = "member">
					<div class = "member_name">
						<p><%=userName %></p>
					<div class = "general">[일반]</div>
					</div>
				</div>
				<%
				}
				%> 
			</div>
			<div class = "pagination">
			<%-- 구현 예정 --%>
			</div>
		</div>
		</div>
	</main>
    <%--푸터--%>
    <%@ include file="../layout/layoutFooter.jsp" %>

    <%--js--%>
    <script src="/CodeCloud/resources/js/group/groupDetail.js"></script>
</body>
</html>