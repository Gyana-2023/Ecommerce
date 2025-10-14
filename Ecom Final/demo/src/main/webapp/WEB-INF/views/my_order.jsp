<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #f4f6f9; margin: 0; padding: 0; }
        h2 { text-align: center; padding: 20px; color: #2c3e50; }
        .order-container { 
            max-width: 900px; 
            margin: 20px auto; 
            padding: 20px; 
            background: white; 
            border-radius: 10px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.1); 
        }
        .order { 
            border: 1px solid #ddd; 
            border-radius: 8px; 
            padding: 15px; 
            margin-bottom: 15px; 
            background: #fafafa; 
        }
        .order p { margin: 5px 0; }
        .order ul { padding-left: 20px; margin: 10px 0; }
        .order li { margin-bottom: 5px; }
        .empty { 
            text-align: center; 
            padding: 40px; 
            background: white; 
            border-radius: 12px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.1); 
            max-width: 600px; 
            margin: 40px auto; 
        }
        .empty p { font-size: 18px; color: #666; margin-bottom: 20px; }
        .btn { 
            display: inline-block; 
            padding: 10px 20px; 
            background: #1abc9c; 
            color: white; 
            text-decoration: none; 
            border-radius: 6px; 
            font-weight: bold; 
            transition: background 0.3s; 
        }
        .btn:hover { background: #16a085; }
    </style>
</head>
<body>

<h2>My Orders</h2>

<div class="order-container">
    <c:if test="${empty orders}">
        <div class="empty">
            <p>🚫 You haven’t ordered anything yet.</p>
            <a href="/products" class="btn">Start Shopping</a>
            <!-- Or: <a href="/home" class="btn">Go to Home</a> -->
        </div>
    </c:if>

    <c:forEach var="o" items="${orders}">
        <div class="order">
            <p><b>Order #${o.id}</b> - ${o.createdAt}</p>
            <p>
                Name: ${o.customerName} | 
                Phone: ${o.phone} | 
                Total: $${o.total} | 
                Status: <b>${o.status}</b>
            </p>
            <ul>
                <c:forEach var="it" items="${o.items}">
                    <li>${it.product.name} × ${it.quantity} — $${it.total}</li>
                </c:forEach>
            </ul>
        </div>
    </c:forEach>
</div>

</body>
</html>
