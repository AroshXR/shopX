package org.example.shopx.model;

import org.example.shopx.model.User;
import java.sql.*;

public class UserDAO {
    public static boolean registerUser(Connection conn, User user) throws SQLException {
        String query = "INSERT INTO users (username, email, password, gender, dob) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getEmail());
        stmt.setString(3, user.getPassword());
        stmt.setString(4, user.gender());
        stmt.setString(5, user.getDob());
        return stmt.executeUpdate() > 0;
    }

    public static User authenticateUser(Connection conn, String username, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new User(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("gender"),
                    rs.getString("dob")
            );
        }
        return null;
    }
}
