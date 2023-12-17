package dao;

import model.Post;
import java.sql.*;
import java.time.LocalDateTime;

public class PostDAO {
    private String jdbcURL = "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud";
    private String jdbcUsername = "staff";
    private String jdbcPassword = "codecloud@2023";

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public Long insertPost(Post post) throws SQLException {
        Long insertedId = null;
        String sql = "INSERT INTO Posts (writer, group_id, title, content, createdAt, updatedAt, viewCnt, likeCnt, commentCnt) "
                   + "VALUES (?, ?, ?, ?, NOW(), NOW(), 0, 0, 0)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, post.getWriterNickname()); // writer를 nickname으로 변경
            preparedStatement.setLong(2, post.getGroupId());
            preparedStatement.setString(3, post.getTitle());
            preparedStatement.setString(4, post.getContent());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = preparedStatement.getGeneratedKeys()) {
                    if (rs.next()) {
                        insertedId = rs.getLong(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // 적절한 예외 처리를 수행합니다.
        }

        return insertedId;
    }

}

