<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 100%;
            max-width: 400px;
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

        .back-button {
            display: block;
            width: 100%;
            padding: 10px;
            background: #35424a;
            color: #ffffff;
            text-align: center;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
            text-decoration: none;
        }

        .back-button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register User</h2>
        <%
            String message = request.getParameter("message");
            if (message != null) {
                String messageType = request.getParameter("type");
        %>
            <div class="message <%= messageType %>"><%= message %></div>
        <%
            }
        %>
        <form action="<%= request.getContextPath() %>/registerUser" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="">Select Role</option>
                <option value="Associate">Associate</option>
                <option value="Admin">Admin</option>
            </select>

            <button type="submit">Register</button>
        </form>
        <a href="<%= request.getContextPath() %>/admindashboard.jsp" class="back-button">Back to Admin Dashboard</a>
    </div>
</body>
</html>
