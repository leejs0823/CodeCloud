package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("pwd"); // 비밀번호 해싱 고려

		System.out.println("🚀 로그인 시도: " + email);
		User user = authenticate(email, password);

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect("index.jsp");
			System.out.println("🚀 로그인 성공: " + email);
		} else {
			response.sendRedirect("views/Auth/authIndex.jsp?error=true");
			System.out.println("❌ 로그인 실패: " + email);
		}
	}

	private User authenticate(String email, String password) {
		UserDAO userDAO = new UserDAO();
		return userDAO.getUserByEmailAndPassword(email, password);
	}
}
