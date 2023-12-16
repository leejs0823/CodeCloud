package controller;

import dao.UserDAO;
import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class UserSignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserSignUp() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pwd"); // 비밀번호 해시 처리 필요
        String nickname = request.getParameter("nickname");
        String description = request.getParameter("description");

        System.out.println("🚀 회원가입 시도: " + email);

        UserDAO userDAO = new UserDAO();
        if (userDAO.emailExists(email)) {
            System.out.println("❌ 이메일 중복: " + email);
            response.sendRedirect("views/Auth/authIndex.jsp?error=true");
            return;
        }

        boolean isUserSaved = userDAO.saveUser(email, password, nickname, description);
        if (isUserSaved) {
            System.out.println("🚀 회원가입 성공: " + email);
            response.sendRedirect("views/Auth/authIndex.jsp?signup=true");
        } else {
            System.out.println("❌ 회원가입 실패: " + email);
            response.sendRedirect("views/Auth/authIndex.jsp?error=true");
        }
    }
}
