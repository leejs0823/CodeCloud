package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;

public class UserSignUpUtil {
    private static final String DB_URL = "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud"; // 데이터베이스 주소
    private static final String USER = "staff"; // DB 사용자 이름
    private static final String PASS = "codecloud@2023"; // DB 비밀번호

    public static void saveUser(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 드라이버 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // SQL 쿼리 준비
            String sql = "INSERT INTO users (email, password, nickname, description) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPassword()); // 비밀번호는 해시 처리 후 저장하는 것이 좋습니다
            pstmt.setString(3, user.getNickname());
            pstmt.setString(4, user.getDescription());

            // 쿼리 실행
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
}
