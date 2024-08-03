package employee.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // Role as a String ("Associate" or "Admin")

        // Validate input data
        if (username == null || password == null || role == null || !(role.equals("Associate") || role.equals("Admin"))) {
            response.sendRedirect("registeruser.jsp?message=Invalid input data&type=error");
            return;
        }

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EM", "root", "1682")) {
            // Check if the username already exists
            String checkUsernameSql = "SELECT COUNT(*) FROM users WHERE username = ?";
            try (PreparedStatement checkUsernameStmt = connection.prepareStatement(checkUsernameSql)) {
                checkUsernameStmt.setString(1, username);
                ResultSet resultSet = checkUsernameStmt.executeQuery();
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    if (count > 0) {
                        response.sendRedirect("registeruser.jsp?message=Username already exists&type=error");
                        return;
                    }
                }
            }

           

            // Insert new user
            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, role);

                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("registeruser.jsp?message=User registered successfully&type=success");
                } else {
                    response.sendRedirect("registeruser.jsp?message=Failed to register user&type=error");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log the exception
            response.sendRedirect("registeruser.jsp?message=Database error&type=error");
        }
    }
}
