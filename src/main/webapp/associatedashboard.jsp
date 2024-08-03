<%@ page import="java.util.List" %>
<%@ page import="employee.model.Task" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Associate Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
        }

        .menu {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .menu a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #35424a;
            color: #ffffff;
            border-radius: 5px;
        }

        .menu a:hover {
            background-color: #45a049;
        }

        .tasks, .charts {
            margin-bottom: 20px;
        }

        .tasks table, .charts table {
            width: 100%;
            border-collapse: collapse;
        }

        .tasks th, .charts th, .tasks td, .charts td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .tasks th, .charts th {
            background-color: #35424a;
            color: #ffffff;
        }

        .tasks tr:nth-child(even), .charts tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Associate Dashboard</h2>
        <div class="menu">
            <a href="viewTasks">View Tasks</a>
            <a href="chart.jsp">View Charts</a>
            <a href="adminlogin.jsp">Logout</a>
        </div>

        <!-- Tasks Section -->
        <div class="tasks">
            <h3>My Tasks</h3>
            <%
                List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                if (tasks == null || tasks.isEmpty()) {
            %>
                <p>No tasks found.</p>
            <%
                } else {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Task ID</th>
                            <th>Project Name</th>
                            <th>Date</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Duration (hours)</th>
                            <th>Task Category</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Task task : tasks) {
                        %>
                            <tr>
                                <td><%= task.getTaskId() %></td>
                                <td><%= task.getProjectName() %></td>
                                <td><%= task.getDate() %></td>
                                <td><%= task.getStartTime() %></td>
                                <td><%= task.getEndTime() %></td>
                                <td><%= task.getDuration() %></td>
                                <td><%= task.getTaskCategory() %></td>
                                <td><%= task.getDescription() %></td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            <%
                }
            %>
        </div>

        <!-- Charts Section -->
        <div class="charts">
            <h3>My Charts</h3>
            <!-- Include charts or graphs here -->
            <p>Charts will be displayed here.</p>
        </div>
    </div>
</body>
</html>
