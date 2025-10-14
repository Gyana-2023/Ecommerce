package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "products")
public class Product {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    @Column(length = 2000)
    private String description;
    private double price;
    private String imageUrl;

    public Product(){}

    public Product(String name, String description, double price, String imageUrl) {
        this.name = name; this.description = description; this.price = price; this.imageUrl = imageUrl;
    }

    // getters / setters
    public Long getId(){ return id; }
    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }
    public String getDescription(){ return description; }
    public void setDescription(String description){ this.description = description; }
    public double getPrice(){ return price; }
    public void setPrice(double price){ this.price = price; }
    public String getImageUrl(){ return imageUrl; }
    public void setImageUrl(String imageUrl){ this.imageUrl = imageUrl; }
}
