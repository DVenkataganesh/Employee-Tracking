package employee.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import employee.dao.TaskDAO;
import employee.model.Task;

@WebServlet("/viewTasks")
public class ViewTasksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskDAO taskDAO;

    public void init() {
        taskDAO = new TaskDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve the session object
        HttpSession session = request.getSession();
        
        // Retrieve the username from the session
        String username = (String) session.getAttribute("username");
        
        // Check if the username is not null
        if (username != null) {
            // Fetch tasks based on the username
            List<Task> tasks = taskDAO.getTasksByUsername(username);

            // Set the tasks attribute for the request
            request.setAttribute("tasks", tasks);

            // Forward the request to the JSP page for rendering
            RequestDispatcher dispatcher = request.getRequestDispatcher("associatedashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the username is not found in session, redirect to login page
            response.sendRedirect("adminlogin.jsp");
        }
    }
}
