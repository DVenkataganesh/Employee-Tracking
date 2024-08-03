<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="employee.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            margin: 10px 0 5px;
        }

        form input, form textarea {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button {
            padding: 10px;
            background: #35424a;
            color: #ffffff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        form button:hover {
            background: #45a049;
        }

        .message {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <%
            Task task = (Task) request.getAttribute("task");
        %>
        <form action="<%= request.getContextPath() %>/editTask" method="post">
            <input type="hidden" name="taskId" value="<%= task.getTaskId() %>">
            
            <label for="projectName">Project Name:</label>
            <input type="text" id="projectName" name="projectName" value="<%= task.getProjectName() %>" required>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= task.getDate() %>" required>

            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%= task.getStartTime() %>" required>

            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%= task.getEndTime() %>" required>

            <label for="duration">Duration (hours):</label>
            <input type="number" id="duration" name="duration" step="0.01" value="<%= task.getDuration() %>" required>

            <label for="taskCategory">Task Category:</label>
            <input type="text" id="taskCategory" name="taskCategory" value="<%= task.getTaskCategory() %>">

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4"><%= task.getDescription() %></textarea>

            <button type="submit">Update Task</button>
        </form>
    </div>
</body>
</html>
