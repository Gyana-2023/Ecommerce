<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .products-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .product-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        /* ✅ Show full image without cropping */
        .product-card img {
            width: 100%;
            height: 220px; /* taller for full image visibility */
            object-fit: contain; /* full image inside box */
            background: #f1f1f1; /* neutral bg for padding areas */
            padding: 10px;
        }

        .product-card-content {
            padding: 15px;
            text-align: center;
        }

        .product-card-content h3 {
            font-size: 18px;
            color: #222;
            margin: 8px 0;
        }

        .product-card-content p {
            font-size: 16px;
            color: #28a745;
            font-weight: bold;
            margin: 8px 0 15px;
        }

        .product-actions {
            display: flex;
            justify-content: space-between;
            gap: 8px;
        }

        .btn {
            flex: 1;
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            text-decoration: none;
            color: #fff;
            transition: background 0.3s ease;
            text-align: center;
        }

        .btn-view {
            background: #007bff;
        }
        .btn-view:hover {
            background: #0069d9;
        }

        .btn-buy {
            background: #28a745;
        }
        .btn-buy:hover {
            background: #218838;
        }

        .btn-cart {
            background: #ffc107;
            color: #333;
        }
        .btn-cart:hover {
            background: #e0a800;
            color: #fff;
        }
    </style>
</head>
<body>
<h2>Products</h2>

<div class="products-container">
    <c:forEach var="product" items="${products}">
        <div class="product-card">
            <img src="${product.imageUrl}" alt="${product.name}">
            <div class="product-card-content">
                <h3>${product.name}</h3>
                <p>$${product.price}</p>
                <div class="product-actions">
                    <a href="/products/${product.id}" class="btn btn-view">View</a>
                    <a href="/buy/${product.id}" class="btn btn-buy">Buy Now</a>
                    <a href="/cart/add/${product.id}" class="btn btn-cart">Add to Cart</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
