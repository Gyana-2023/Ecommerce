<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-Shop | Home</title>
    <style>
        /* Global */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0; padding: 0;
            background: linear-gradient(135deg, #f6f9fc, #eaf0f3);
            color: #333;
        }

        /* Header with glassmorphism */
        header {
            backdrop-filter: blur(10px);
            background: rgba(44, 62, 80, 0.9);
            color: white;
            padding: 15px 50px;
            display: flex; justify-content: space-between; align-items: center;
            position: sticky; top: 0; z-index: 100;
            box-shadow: 0 4px 20px rgba(0,0,0,0.25);
        }
        header h1 {
            margin: 0; font-size: 26px; font-weight: 700;
            letter-spacing: 1px;
        }
        nav { display: flex; align-items: center; gap: 25px; }
        nav a {
            color: white; text-decoration: none; font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }
        nav a::after {
            content: "";
            position: absolute;
            width: 0%; height: 2px;
            bottom: -4px; left: 0;
            background: #1abc9c;
            transition: width 0.3s ease;
        }
        nav a:hover::after { width: 100%; }
        nav a:hover { color: #1abc9c; }

        /* Search bar */
        .search-bar {
            display: flex; gap: 10px;
            background: rgba(255,255,255,0.15);
            padding: 6px 12px; border-radius: 30px;
            transition: all 0.3s ease;
        }
        .search-bar input {
            padding: 8px 14px; border: none; border-radius: 20px;
            outline: none; background: transparent; color: white;
            width: 180px; transition: width 0.3s ease;
        }
        .search-bar input:focus { width: 250px; }
        .search-bar button {
            background: #1abc9c; border: none; border-radius: 20px;
            padding: 8px 18px; color: white; font-weight: bold;
            cursor: pointer; transition: all 0.3s ease;
        }
        .search-bar button:hover { background: #16a085; }

        /* Hero banner */
        .banner {
            position: relative;
            background: url('https://images.unsplash.com/photo-1563013544-824ae1b704d3?auto=format&fit=crop&w=1600&q=80') no-repeat center/cover;
            height: 450px;
            display: flex; flex-direction: column;
            align-items: center; justify-content: center;
            text-align: center;
            color: white;
            overflow: hidden;
        }
        .banner::before {
            content: "";
            position: absolute; inset: 0;
            background: rgba(0,0,0,0.45);
        }
        .banner h2 {
            position: relative;
            font-size: 50px;
            font-weight: 800;
            text-shadow: 0 4px 15px rgba(0,0,0,0.8);
            margin: 0 20px 10px;
        }
        .banner p {
            position: relative;
            font-size: 20px;
            max-width: 700px;
            margin: 0 20px;
            color: #f1f1f1;
            text-shadow: 0 2px 10px rgba(0,0,0,0.6);
        }
        .banner .shop-now-btn {
            position: relative;
            margin-top: 25px;
            background: #1abc9c;
            color: white;
            border: none;
            padding: 14px 34px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }
        .banner .shop-now-btn:hover {
            background: #16a085;
            transform: translateY(-3px);
        }

        /* Products grid */
        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 32px; padding: 60px;
            max-width: 1400px; margin: auto;
        }
        .product {
            background: white; border-radius: 18px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden; display: flex; flex-direction: column;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.2);
        }
        .product img {
            width: 100%; height: 220px; object-fit: contain;
            background: #fafafa; padding: 15px;
        }
        .product h3 {
            margin: 15px; font-size: 20px; font-weight: 600;
            color: #2c3e50;
        }
        .product p {
            margin: 0 15px 15px; font-size: 14px; color: #666; flex-grow: 1;
        }
        .price {
            margin: 0 15px 18px; font-size: 20px;
            font-weight: bold; color: #27ae60;
        }
        .btn {
            display: inline-block; padding: 10px; margin: 0 12px 16px;
            border-radius: 8px; text-align: center; text-decoration: none;
            font-weight: 500; color: white; transition: all 0.3s ease;
        }
        .btn-add { background: #1abc9c; }
        .btn-add:hover { background: #16a085; }
        .btn-buy { background: #ff9800; margin-left: 6px; }
        .btn-buy:hover { background: #e68900; }

        /* Orders section */
        .orders {
            max-width: 1200px; margin: 40px auto;
            background: white; padding: 25px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .orders h2 { margin-bottom: 18px; color: #2c3e50; font-size: 22px; }
        .orders table { width: 100%; border-collapse: collapse; }
        .orders th, .orders td {
            padding: 14px; text-align: center; border-bottom: 1px solid #ddd;
        }
        .orders th { background: #2c3e50; color: white; }
        .orders tr:hover { background: #f9f9f9; }

        /* Search results message */
        .results { text-align: center; margin: 30px; }
        .results h2 { font-size: 22px; color: #2c3e50; margin-bottom: 10px; }
        .results p { color: #888; font-size: 16px; }

        /* Footer with gradient */
        footer {
            background: linear-gradient(90deg, #2c3e50, #34495e);
            color: white; text-align: center;
            padding: 25px; font-size: 14px; margin-top: 50px;
        }
    </style>
</head>
<body>

<header>
    <h1>E-Shop</h1>
    <nav>
        <a href="/home">Home</a>
        <a href="/products">Products</a>
        <a href="/cart">Cart 🛒</a>
        <a href="/my-orders">My Orders</a>
        <a href="#profile">Profile</a>

        <!-- ✅ Search bar -->
        <form action="/home" method="get" class="search-bar">
            <input type="text" name="q" placeholder="Search products..." value="${searchQuery}">
            <button type="submit">🔍</button>
        </form>
    </nav>
</header>

<!-- ✅ New Enhanced Banner -->
<div class="banner">
    <h2>Unbeatable Deals. Endless Choices.</h2>
    <p>Discover top-quality products at prices that make you smile. <br>
       Shop smarter, faster, and better — only at <strong>E-Shop</strong>.</p>
    <a href="/products" class="shop-now-btn">🛍️ Shop Now</a>
</div>

<!-- ✅ Products -->
<section class="products">
    <c:forEach var="product" items="${products}">
        <div class="product">
            <img src="${product.imageUrl}" alt="${product.name}">
            <h3>${product.name}</h3>
            <p>${product.description}</p>
            <div class="price">$${product.price}</div>
            <a href="/cart/add/${product.id}" class="btn btn-add">Add to Cart</a>
            <a href="/buy/${product.id}" class="btn btn-buy">Buy Now</a>
        </div>
    </c:forEach>
</section>

<!-- ✅ Orders -->
<c:if test="${not empty orders}">
    <section class="orders">
        <h2>My Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product</th>
                    <th>Qty</th>
                    <th>Total</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td><c:out value="${order.product != null ? order.product.name : 'Multiple Items'}"/></td>
                        <td>${order.quantity}</td>
                        <td>$${order.total}</td>
                        <td>${order.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</c:if>

<!-- ✅ Search results message -->
<c:if test="${not empty searchQuery}">
    <div class="results">
        <h2>Search Results for "<c:out value='${searchQuery}'/>"</h2>
        <c:if test="${empty products}">
            <p>No products found 😢</p>
        </c:if>
    </div>
</c:if>

<footer>
    <p>&copy; 2025 E-Shop. All Rights Reserved.</p>
</footer>

</body>
</html>
