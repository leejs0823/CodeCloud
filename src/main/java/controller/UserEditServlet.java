package controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UserEditServlet
 */
@WebServlet("/editServlet")
public class UserEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); // 요청에서 액션 파라미터를 읽어옵니다.

        if ("updateUser".equals(action)) {
            // 유저 업데이트 하기 
            boolean updateSuccess = updateUser(request, response);

            if (updateSuccess) {
                // 유저 정보가 성공적으로 업데이트된 후 세션 업데이트
                HttpSession session = request.getSession();
                User updatedUser = retrieveUpdatedUser(request); 
                session.setAttribute("user", updatedUser);
            } else {
                // Handle update failure
                // Maybe redirect to an error page or show an error message
            }
        } else {
            // 알 수 없는 액션일 경우, 적절한 오류 처리를 수행합니다.
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Unknown action: " + action);
        }
    }

    private User retrieveUpdatedUser(HttpServletRequest request) {
        String userEmail = request.getParameter("email");
        UserDAO userDao = new UserDAO();
        User updatedUser = null;

        if (userEmail != null && !userEmail.isEmpty()) {
            try {
                updatedUser = userDao.getUserByEmail(userEmail);
            } catch (Exception e) {
                // Log the exception, handle it, or throw it as needed
                e.printStackTrace();
            }
        }

        return updatedUser;
    }



    private boolean updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자 정보를 수정하기 위한 로직을 구현합니다.
        // 필요한 파라미터를 request에서 읽어와서 UserDAO를 사용하여 사용자 정보를 업데이트합니다.

        String userEmail = request.getParameter("email");
        String newNickname = request.getParameter("nickname");
        String newDescription = request.getParameter("description");

        if (userEmail == null || newNickname == null || newDescription == null) {
            // 필수 파라미터가 누락되었을 경우, 적절한 오류 처리를 수행합니다.
            
            response.getWriter().write("Missing required parameters.");
            response.getWriter().write(userEmail);
            return false;
        }

        try {
            UserDAO userDao = new UserDAO();

            if (userDao.updateUser(userEmail, newNickname, newDescription)) {
                // 사용자 정보 업데이트에 성공했을 경우, 적절한 응답을 반환합니다.
                response.getWriter().write("User information updated successfully.");
                response.sendRedirect("views/user/userMypage.jsp");
                return true;
                
            } else {
                // 사용자 정보 업데이트에 실패했을 경우, 적절한 오류 처리를 수행합니다.
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to update user information.");
            }
        } catch (NumberFormatException e) {
            // userId가 잘못된 형식일 경우, 적절한 오류 처리를 수행합니다.
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid userId format.");
        }
		return false;
    }

}
