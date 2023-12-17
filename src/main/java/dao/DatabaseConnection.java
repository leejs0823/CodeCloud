package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:mysql://db-jv9ds-kr.vpc-pub-cdb.ntruss.com:3306/codecloud";
    private static final String USER = "staff";
    private static final String PASSWORD = "codecloud@2023";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
