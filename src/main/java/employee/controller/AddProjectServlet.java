package employee.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addProject")
public class AddProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectName = request.getParameter("projectName");

        if (projectName == null || projectName.isEmpty()) {
            response.sendRedirect("addProject.jsp?message=Project name is required&type=error");
            return;
        }

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EM", "root", "1682")) {
            String sql = "INSERT INTO projects (project_name) VALUES (?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, projectName);
                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("addProject.jsp?message=Project added successfully&type=success");
                } else {
                    response.sendRedirect("addProject.jsp?message=Failed to add project&type=error");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addProject.jsp?message=Database error&type=error");
        }
    }
}
