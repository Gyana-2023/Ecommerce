<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.name}</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 20px;
        }

        .product-container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
        }

        .product-image {
            flex: 1 1 350px;
            text-align: center;
        }

        .product-image img {
            width: 100%;
            max-width: 400px;
            height: 400px;
            object-fit: contain;
            background: #f1f1f1;
            border-radius: 10px;
            padding: 10px;
        }

        .product-details {
            flex: 1 1 400px;
        }

        .product-details h2 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #222;
        }

        .product-details p.description {
            font-size: 16px;
            color: #555;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .product-details p.price {
            font-size: 22px;
            color: #28a745;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .product-actions {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn {
            flex: 1;
            min-width: 150px;
            text-align: center;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: 0.3s;
            color: #fff;
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

        .btn-back {
            background: #6c757d;
        }
        .btn-back:hover {
            background: #5a6268;
        }

        @media (max-width: 768px) {
            .product-container {
                flex-direction: column;
                text-align: center;
            }
            .product-actions {
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<div class="product-container">
    <div class="product-image">
        <img src="${product.imageUrl}" alt="${product.name}">
    </div>

    <div class="product-details">
        <h2>${product.name}</h2>
        <p class="description">${product.description}</p>
        <p class="price">$${product.price}</p>

        <div class="product-actions">
            <a href="/buy/${product.id}" class="btn btn-buy">Buy Now</a>
            <a href="/cart/add/${product.id}" class="btn btn-cart">Add to Cart</a>
            <a href="/products" class="btn btn-back">Back to Products</a>
        </div>
    </div>
</div>

</body>
</html>
