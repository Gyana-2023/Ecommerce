<html>
<head>
    <title>Add Product</title>
    <style>
        body { font-family: Arial; background: #f9f9f9; }
        .container { width: 40%; margin: 40px auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.2); }
        h2 { text-align: center; }
        label { display: block; margin-top: 10px; }
        input, textarea { width: 100%; padding: 8px; margin-top: 5px; border: 1px solid #ddd; border-radius: 5px; }
        button { margin-top: 15px; padding: 10px 15px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background: #0056b3; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add New Product</h2>
    <form action="/admin/products/add" method="post">
        <label>Name:</label>
        <input type="text" name="name" required>
        
        <label>Description:</label>
        <textarea name="description" rows="3"></textarea>
        
        <label>Price:</label>
        <input type="number" name="price" step="0.01" required>
        
        <label>Image URL:</label>
        <input type="text" name="imageUrl">
        
        <button type="submit">Save Product</button>
    </form>
</div>
</body>
</html>
