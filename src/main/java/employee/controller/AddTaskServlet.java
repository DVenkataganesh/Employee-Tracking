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

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String projectName = request.getParameter("projectName");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        Double duration = Double.parseDouble(request.getParameter("duration"));
        String taskCategory = request.getParameter("taskCategory");
        String description = request.getParameter("description");

        if (username == null || projectName == null || date == null || startTime == null || endTime == null || duration == null) {
            response.sendRedirect("addTask.jsp?message=All fields are required&type=error");
            return;
        }

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/EM", "root", "1682")) {
            String sql = "INSERT INTO tasks (username, project_name, date, start_time, end_time, duration, task_category, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, projectName);
                preparedStatement.setDate(3, java.sql.Date.valueOf(date));
                preparedStatement.setString(4, startTime);
                preparedStatement.setString(5, endTime);
                preparedStatement.setDouble(6, duration);
                preparedStatement.setString(7, taskCategory);
                preparedStatement.setString(8, description);

                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("addTask.jsp?message=Task added successfully&type=success");
                } else {
                    response.sendRedirect("addTask.jsp?message=Failed to add task&type=error");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addTask.jsp?message=Database error&type=error");
        }
    }
}
