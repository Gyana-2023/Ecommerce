E-Commerce Website (JSP + Spring Boot + Hibernate CRUD)
📖 Overview

This project is a Java-based E-commerce Website built using Spring Boot, Hibernate (JPA), and JSP for the front end.
It demonstrates CRUD (Create, Read, Update, Delete) operations on products, users, and orders.
The system allows customers to browse products, manage their cart, and place orders, while admins can manage inventory and user details.

🚀 Features
👤 User Features

🛒 Browse all available products (Read)

🔍 Search products by name or category

➕ Add products to cart

🧾 Place orders

🔐 Login / Register functionality

⚙️ Admin Features

➕ Create a new product

📋 Read product list

✏️ Update product information (name, price, description, stock)

❌ Delete products

📦 Manage customers and orders

🧩 CRUD Operations
Operation	Description	Example URL
Create	Add a new product	/admin/addProduct
Read	View all products	/products
Update	Edit product details	/admin/updateProduct/{id}
Delete	Remove a product	/admin/deleteProduct/{id}
🧠 Technologies Used
Layer	Technology
Frontend	JSP, HTML, CSS, Bootstrap
Backend	Java Spring Boot
ORM / Database Layer	Hibernate (JPA)
Database	MySQL / PostgreSQL
Build Tool	Maven
Server	Apache Tomcat (embedded in Spring Boot)
📂 Project Structure
ecommerce-springboot/
│
├── src/
│   ├── main/
│   │   ├── java/com/demo/
│   │   │   ├── controller/       # Handles web requests (CRUD)
│   │   │   ├── model/            # Entity classes (Product, User, Order)
│   │   │   ├── repository/       # Hibernate JPA repositories
│   │   │   └── service/          # Business logic layer
│   │   ├── resources/
│   │   │   ├── application.properties  # DB config, port, etc.
│   │   │   └── templates/        # JSP pages (views)
│   │   └── webapp/
│   │       └── WEB-INF/jsp/      # JSP files (Home, Admin, Product, etc.)
│   └── test/                     # Unit tests
│
├── pom.xml                       # Maven dependencies
└── README.md                     # Project documentation



Mysql Database setup:-
crate a databse named "user_db"
create a user table in user_db
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);
