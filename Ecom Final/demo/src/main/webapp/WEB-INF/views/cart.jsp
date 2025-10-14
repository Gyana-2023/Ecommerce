<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
            background: #fff;
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background: #007bff;
            color: #fff;
        }

        table tr:hover {
            background: #f1f1f1;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .btn-remove {
            background: #dc3545;
            color: #fff;
        }

        .btn-remove:hover {
            background: #b52a37;
        }

        .btn-buy {
            background: #28a745;
            color: #fff;
        }

        .btn-buy:hover {
            background: #218838;
        }

        .grand-total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 10px;
            color: #333;
        }

        .empty-cart {
            text-align: center;
            padding: 30px;
            font-size: 16px;
            color: #555;
        }

        .empty-cart a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .empty-cart a:hover {
            text-decoration: underline;
        }

        .checkout-section {
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Cart</h2>

    <c:if test="${empty cartItems}">
        <div class="empty-cart">
            <p>Your cart is empty. <a href="/products">Go Shopping</a></p>
        </div>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table>
            <tr>
                <th>Product</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.quantity}</td>
                    <td>$${item.product.price}</td>
                    <td>$${item.totalPrice}</td>
                    <td>
                        <a class="btn btn-remove" href="/cart/remove/${item.id}">Remove</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div class="grand-total">
            Grand Total: $${total}
        </div>

        <div class="checkout-section">
            <a class="btn btn-buy" href="/checkout/cart">Buy Now</a>
        </div>
    </c:if>
</div>
</body>
</html>
