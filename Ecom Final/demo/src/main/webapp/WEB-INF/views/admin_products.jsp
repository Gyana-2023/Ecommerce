<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Products</title>
    <style>
        body { font-family: Arial; background: #f2f2f2; }
        .container { width: 90%; margin: 20px auto; }
        h2 { text-align: center; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; background: #fff; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 10px; text-align: center; }
        th { background: #007bff; color: white; }
        .btn { padding: 5px 10px; color: white; text-decoration: none; border-radius: 5px; }
        .btn-add { background: green; }
        .btn-delete { background: red; }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin - Product Management</h2>
    <a href="/admin/products/add" class="btn btn-add">+ Add Product</a>
    <br><br>
    <table>
        <tr>
            <th>ID</th><th>Image</th><th>Name</th><th>Price</th><th>Actions</th>
        </tr>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td><img src="${product.imageUrl}" width="80"></td>
                <td>${product.name}</td>
                <td>$${product.price}</td>
                <td>
                    <a href="/admin/products/delete/${product.id}" class="btn btn-delete">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
