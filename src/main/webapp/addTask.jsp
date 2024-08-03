<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
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

        form input, form select {
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
        <h2>Add Task</h2>
        <%
            String message = request.getParameter("message");
            if (message != null) {
                String messageType = request.getParameter("type");
        %>
            <div class="message <%= messageType %>"><%= message %></div>
        <%
            }
        %>
        <form action="<%= request.getContextPath() %>/addTask" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="projectName">Project Name:</label>
            <input type="text" id="projectName" name="projectName">

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required>

            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" required>

            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" required>

            <label for="duration">Duration (hours):</label>
            <input type="number" id="duration" name="duration" step="0.01" max="8.00" required>

            <label for="taskCategory">Task Category:</label>
            <input type="text" id="taskCategory" name="taskCategory">

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4"></textarea>

            <button type="submit">Add Task</button>
        </form>
    </div>
</body>
</html>
