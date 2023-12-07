package controller;

import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import utility.UserSignUpUtil;

@WebServlet("/auth/signup")
public class UserSignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserSignUp() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 정보 가져 오기 
        String email = request.getParameter("email");
        String password = request.getParameter("pwd"); 
        String nickname = request.getParameter("nickname");
        String description = request.getParameter("introduce");

        try {
            // Create user 
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setPassword(password); // 여기서 비밀번호 해싱을 고려해야 함
            newUser.setNickname(nickname);
            newUser.setDescription(description);
            newUser.setGroupCount(0); 
            newUser.setGroups(new ArrayList<>()); 
            newUser.setAdmin(false);

            // 데이터베이스에 사용자 저장
            UserSignUpUtil.saveUser(newUser);

            // 성공 응답 보내기
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("회원가입 성공");
        } catch (Exception e) {
            // 실패 응답 보내기
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("회원가입 실패: " + e.getMessage());
        }
    }
}
