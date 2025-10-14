<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Status | E-Shop</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
        }

        h1.success { color: #28a745; }
        h1.failed { color: #dc3545; }

        h3 {
            margin-top: 10px;
            color: #2c3e50;
        }

        p {
            font-size: 15px;
            color: #555;
        }

        .order-info {
            margin: 20px 0;
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 15px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
        }

        th {
            background: #007bff;
            color: #fff;
            font-weight: 600;
        }

        tr:hover {
            background: #f8faff;
        }

        .summary {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            color: #27ae60;
        }

        .btn-container {
            text-align: center;
            margin-top: 25px;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            margin: 8px;
            background: #007bff;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s, transform 0.2s;
        }

        .btn:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: #28a745;
        }

        .btn-secondary:hover {
            background: #1e7e34;
        }

        .btn-fail {
            background: #dc3545;
        }

        .btn-fail:hover {
            background: #b52a37;
        }

        /* ✅ Responsive */
        @media (max-width: 600px) {
            .container { width: 90%; padding: 20px; }
            table { font-size: 13px; }
            th, td { padding: 8px; }
        }
    </style>
</head>
<body>
<div class="container">

    <c:choose>
        <c:when test="${status == 'success'}">
            <h1 class="success">✅ Order Placed Successfully!</h1>

            <div class="order-info">
                <h3>Order Details</h3>
                <p><strong>Order ID:</strong> ${order.id}</p>
                <p><strong>Customer:</strong> ${order.customerName}</p>
                <p><strong>Address:</strong> ${order.address}</p>
                <p><strong>Phone:</strong> ${order.phone}</p>
                <p><strong>Email:</strong> ${order.email}</p>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price (₹)</th>
                        <th>Quantity</th>
                        <th>Subtotal (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${order.items}">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>${item.price}</td>
                            <td>${item.quantity}</td>
                            <td>${item.price * item.quantity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="summary">
                Total Amount: ₹${order.total}
            </div>

            <div class="btn-container">
                <a href="/products" class="btn">🛒 Continue Shopping</a>
                <a href="/my-orders" class="btn btn-secondary">📦 View My Orders</a>
            </div>
        </c:when>

        <c:otherwise>
            <h1 class="failed">❌ Order Failed!</h1>
            <p style="text-align:center;">Something went wrong. Please try again.</p>
            <div class="btn-container">
                <a href="/products" class="btn btn-fail">⬅ Back to Products</a>
            </div>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>
