package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDAO {

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        String query = "SELECT * FROM Users WHERE email = ? AND password = ?"; // 해시된 비밀번호 사용 고려

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    // 사용자 정보 설정
                    user.setId(rs.getLong("id"));
                    user.setEmail(rs.getString("email"));
                    user.setNickname(rs.getString("nickname"));
                    user.setDescription(rs.getString("description"));
                    // 나머지 속성 설정
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 적절한 예외 처리
        }
        return user;
    }
    
 // 유저 회원 가입
    public boolean saveUser(String email, String password, String nickname, String description) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            // Check if the email already exists
            if (emailExists(email)) {
                System.out.println("❌ 이메일 중복: " + email);
                return false;
            }

            // Prepare SQL statement for inserting new user
            String sql = "INSERT INTO Users (email, password, nickname, description) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password); // 비밀번호 해시 처리 필요
                stmt.setString(3, nickname);
                stmt.setString(4, description);

                int affectedRows = stmt.executeUpdate();
                return affectedRows > 0;
            }
        } catch (SQLException e) {
            System.out.println("❌ DB 오류: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    
    // 이메일 체킹 
 // 이메일 체킹
    public boolean emailExists(String email) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT COUNT(*) FROM Users WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, email);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1) > 0;
                    }
                }
            }
            return false;
        } catch (SQLException e) {
            System.out.println("❌ DB 오류: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    
}
