<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
        input { width: 100%; margin-bottom: 15px; padding: 10px; }
        button {
            padding: 10px;
            width: 100%;
            background: #007bff;
            border: none;
            color: white;
            font-size: 16px;
        }
        h2 { text-align: center; margin-bottom: 20px; }
        .error { color: red; text-align: center; margin-bottom: 15px; }
    </style>
</head>
<body>

<form action="/login" method="post">
    <h2>User Login</h2>

    <!-- ✅ Error Message -->
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <input type="text" name="username" placeholder="Enter username" required />
    <input type="password" name="password" placeholder="Enter password" required />
    <button type="submit">Login</button>
</form>

</body>
</html>
