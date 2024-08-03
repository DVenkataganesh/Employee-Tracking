package employee.controller;

import employee.dao.TaskDAO;
import employee.model.Task;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editTask")
public class EditTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        TaskDAO taskDAO = new TaskDAO();
        Task task = taskDAO.getTaskById(taskId);

        if (task != null) {
            request.setAttribute("task", task);
            request.getRequestDispatcher("editTask.jsp").forward(request, response);
        } else {
            response.sendRedirect("viewTasks.jsp?message=Task not found&type=error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        String projectName = request.getParameter("projectName");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        double duration = Double.parseDouble(request.getParameter("duration"));
        String taskCategory = request.getParameter("taskCategory");
        String description = request.getParameter("description");

        TaskDAO taskDAO = new TaskDAO();
        boolean success = taskDAO.updateTask(taskId, projectName, date, startTime, endTime, duration, taskCategory, description);

        if (success) {
            response.sendRedirect("viewTasks.jsp?message=Task updated successfully&type=success");
        } else {
            response.sendRedirect("viewTasks.jsp?message=Failed to update task&type=error");
        }
    }
}
