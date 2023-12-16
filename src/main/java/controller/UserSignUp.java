package controller;

import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/signup")
public class UserSignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserSignUp() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 정보 가져 오기
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String nickname = request.getParameter("nickname");
        String description = request.getParameter("description");

        System.out.println("🚀 회원가입 시도: " + email);

        // Attempt to save the user
        boolean isUserSaved = saveUser(email, password, nickname, description);

        if (isUserSaved) {
            System.out.println("🚀 회원가입 성공: " + email);
            response.sendRedirect("index.jsp"); // Redirect to the index page
        } else {
            System.out.println("❌ 회원가입 실패: " + email);
            response.sendRedirect("/signup.jsp?error=true"); // Redirect to the signup page with an error flag
        }
    }

    private boolean saveUser(String email, String password, String nickname, String description) {
        // Connect to DB and insert new user
		String url = "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud";
		String dbUser = "staff";
		String dbPassword = "codecloud@2023";

        System.out.println("🚀 DB 연결 시도");

        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO Users (email, password, nickname, description) VALUES (?, ?, ?, ?)")) {

            stmt.setString(1, email);
            stmt.setString(2, password); // Remember to hash the password
            stmt.setString(3, nickname);
            stmt.setString(4, description);

            int affectedRows = stmt.executeUpdate();

            System.out.println("🚀 쿼리 실행: " + stmt);

            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println("❌ DB 오류: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
