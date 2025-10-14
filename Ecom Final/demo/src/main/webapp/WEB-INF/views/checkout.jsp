<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f8; margin: 0; padding: 0; }
        .container {
            max-width: 900px; margin: 40px auto; background: white;
            padding: 30px 40px; border-radius: 12px; box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        h2 { text-align: center; color: #333; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 25px; }
        table th, table td { padding: 10px; border-bottom: 1px solid #ddd; text-align: center; }
        table th { background: #007bff; color: white; }
        .form-section { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type=text], input[type=email], input[type=number] {
            width: 100%; padding: 10px; border-radius: 6px; border: 1px solid #ccc;
        }
        .btn {
            background: #28a745; color: white; border: none;
            padding: 12px 20px; border-radius: 8px; cursor: pointer;
        }
        .btn:hover { background: #218838; }
        .total { font-size: 18px; font-weight: bold; text-align: right; margin-top: 10px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Checkout</h2>

    <!-- ✅ If buying a single product -->
    <c:if test="${not empty product}">
        <table>
            <tr><th>Product</th><th>Quantity</th><th>Price</th><th>Total</th></tr>
            <tr>
                <td>${product.name}</td>
                <td>${quantity}</td>
                <td>$${product.price}</td>
                <td>$${product.price * quantity}</td>
            </tr>
        </table>

        <form action="/checkout/confirm" method="post">
            <input type="hidden" name="productId" value="${product.id}">
            <input type="hidden" name="quantity" value="${quantity}">
            
            <div class="form-section"><label>Full Name:</label><input type="text" name="customerName" required></div>
            <div class="form-section"><label>Address:</label><input type="text" name="address" required></div>
            <div class="form-section"><label>Phone:</label><input type="text" name="phone" required></div>
            <div class="form-section"><label>Email (optional):</label><input type="email" name="email"></div>
            <button type="submit" class="btn">Place Order</button>
        </form>
    </c:if>

    <!-- ✅ If checking out from cart -->
    <c:if test="${not empty cartItems}">
        <table>
            <tr><th>Product</th><th>Qty</th><th>Price</th><th>Total</th></tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.quantity}</td>
                    <td>$${item.product.price}</td>
                    <td>$${item.totalPrice}</td>
                </tr>
            </c:forEach>
        </table>
        <div class="total">Grand Total: $${total}</div>

        <form action="/checkout/cart-confirm" method="post">
            <div class="form-section"><label>Full Name:</label><input type="text" name="customerName" required></div>
            <div class="form-section"><label>Address:</label><input type="text" name="address" required></div>
            <div class="form-section"><label>Phone:</label><input type="text" name="phone" required></div>
            <div class="form-section"><label>Email (optional):</label><input type="email" name="email"></div>
            <button type="submit" class="btn">Confirm Order</button>
        </form>
    </c:if>
</div>
</body>
</html>
