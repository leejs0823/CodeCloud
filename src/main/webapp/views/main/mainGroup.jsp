<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Group" %>
<%@ page import="model.GroupMembership" %>
<%@ page import="dao.GroupDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
	GroupDAO groupDAO = new GroupDAO();
	ArrayList<Group> allGroups = groupDAO.getAllGroups();
	for (Group group : allGroups) {
		if(group!=null){
			String groupName = group.getGroupName();
			Long groupId = group.getGroupId();
			String description = group.getDescription();
			int totalMember = groupDAO.countGroupUsers(groupId);
					%>
    <div class="group">
        <div class="profile"></div>
        <p class="group_name"><%= groupName %></p>
        <p class="introduction"><%= description %></p>
        <div class="total_member">
            <p>total member : </p>
            <p><%= totalMember %>명 </p>
        </div>
    </div>
<% } 
}
%>