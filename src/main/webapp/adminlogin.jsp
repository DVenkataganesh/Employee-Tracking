<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
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

        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            margin: 10px 0 5px;
        }

        form input {
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

        .error, .logout-success {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }

        .logout-success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2> Login Page</h2>
        <%
            String error = request.getParameter("error");
            String logout = request.getParameter("logout");
            if (error != null) {
        %>
            <div class="error">Invalid username or password.</div>
        <%
            } else if (logout != null) {
        %>
            <div class="logout-success">You have successfully logged out.</div>
        <%
            }
        %>
        <form action="<%=request.getContextPath()%>/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
