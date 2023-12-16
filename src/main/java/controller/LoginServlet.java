package controller;

import model.User;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// POST 요청을 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 파라미터 읽기, email, pwd는 
		String email = request.getParameter("email");
		String password = request.getParameter("pwd"); 
		// 로그인 처리
		System.out.println("🚀 로그인 시도: " + email); 
		// 로그인 성공 시 세션에 사용자 정보를 저장
		User user = authenticate(email, password);
		// 로그인 성공시 
		if (user != null) {
			// 세션에 사용자 정보를 저장
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect("index.jsp");
			System.out.println("🚀 로그인 성공: " + email);
			// main page로 이동 
			
		} else {
			// 로그인 실패시
			// 로그인 폼으로 리다이렉트
			response.sendRedirect("/views/Auth/Authlogin.jsp?error=true");

			System.out.println("❌ 로그인 실패: " + email); // Add this line
		}
	}

	private User authenticate(String email, String password) {
		User user = null;
		// 환경 변수나 설정 파일에서 데이터베이스 연결 정보를 가져오는 로직 필요
		String url = "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud";
		String dbUser = "staff";
		String dbPassword = "codecloud@2023";

		System.out.println("🚀 DB 연결 시도: " + url); // Add this line

		try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
				PreparedStatement stmt = conn
						.prepareStatement("SELECT * FROM Users WHERE email = ? AND password = ?")) {

			stmt.setString(1, email);
			stmt.setString(2, password); // 이 부분은 실제로는 해시된 비밀번호와 비교

			System.out.println("🚀 쿼리 실행: " + stmt); // Add this line

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					user = new User();
					// 사용자 정보 설정
					user.setId(rs.getLong("id"));
					user.setEmail(rs.getString("email"));
					user.setNickname(rs.getString("nickname"));
					// 나머지 속성 설정
					System.out.println("🚀 사용자 찾음: " + email); // Add this line
				} else {
					System.out.println("❌ 사용자 없음: " + email); // Add this line
				}
			}
		} catch (SQLException e) {
			System.out.println("❌ DB 오류: " + e.getMessage()); // Add this line
			e.printStackTrace();
			// 적절한 예외 처리 및 사용자 피드백
		}
		return user;
	}
}
