<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Post" %>
<%@ page import="dao.PostDAO" %>
<%@ page import="model.Group" %>
<%@ page import="model.GroupMembership" %>
<%@ page import="dao.GroupDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <% 
    GroupDAO groupDAO = new GroupDAO();
    PostDAO postDAO = new PostDAO();
    List<Post> allPosts = new ArrayList<>();
    allPosts = postDAO.getAllPosts();
    

    for(Post post : allPosts){
    	if(post!=null){
    		int likeCnt = post.getLikeCnt();
    		int postId = post.getId();
			String content = post.getContent();
			String title = post.getTitle();
			Group group = groupDAO.getGroupById(post.getGroupId());
			String groupName = group.getGroupName();
			String writer = groupDAO.getUserById(post.getWriter());
			%>
		<div class="post" onclick="location.href='/CodeCloud/view/post/postDetail.jsp?postId='+ <%=postId %>;" >
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
						<p>in </p>
						<p><%=groupName %></p>
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
    
		