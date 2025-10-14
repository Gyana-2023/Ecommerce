<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty message}">
    <p style="color: green; text-align: center; font-weight: bold;">
        ${message}
    </p>
</c:if>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body { font-family: Arial; background: #f0f0f0; padding: 50px; }
        form {
            background: white;
            padding: 30px;
            border-radius: 5px;
            width: 350px;
            margin: auto;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        input, select {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            box-sizing: border-box;
        }
        button {
            padding: 10px;
            width: 100%;
            background: #28a745;
            border: none;
            color: white;
            font-size: 16px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
        .login-link a {
            color: #007bff;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<form action="/index" method="post">
    <h2>User Registration</h2>
    <input type="text" name="username" placeholder="Enter username" required />
    <input type="password" name="password" placeholder="Enter password" required />
    <select name="role" required>
        <option value="">Select Role</option>
        <option value="USER">User</option>
        <option value="ADMIN">Admin</option>
    </select>
    <button type="submit">Register</button>

    <div class="login-link">
        Already registered? <a href="/login">Login here</a>
    </div>
</form>

</body>
</html>
