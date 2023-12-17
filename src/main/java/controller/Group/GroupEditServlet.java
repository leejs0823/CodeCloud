package controller.Group;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import dao.GroupDAO;
import model.Group;
import model.User;

@WebServlet("/groupEditServlet")
public class GroupEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String groupName = request.getParameter("group_name");
		String groupDescription = request.getParameter("group_description");
		
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		
		if(currentUser!=null) {

			
			int id = 1;
			Long groupId = Long.valueOf(id);
			
			GroupDAO groupDAO = new GroupDAO();
			Group existingGroup = (Group)groupDAO.getGroupById(groupId);

			if(existingGroup!=null) {
				existingGroup.setGroupName(groupName);
				existingGroup.setDescription(groupDescription);
				
				groupDAO.updateGroup(existingGroup);
				
				response.sendRedirect("/CodeCloud/views/group/groupAdmin.jsp");
			}else {
				
			}
		}else {
			response.sendRedirect("/CodeCloud/views/Auth/authIndex.jsp");
		}
	}
}