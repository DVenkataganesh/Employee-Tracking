package employee.controller;

import employee.dao.TaskDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        TaskDAO taskDAO = new TaskDAO();
        boolean success = taskDAO.deleteTask(taskId);

        if (success) {
            response.sendRedirect("viewTasks.jsp?message=Task deleted successfully&type=success");
        } else {
            response.sendRedirect("viewTasks.jsp?message=Failed to delete task&type=error");
        }
    }
}
