package com.example.demo.controller;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class ProductController {

    @Autowired 
    private ProductRepository productRepository;

    // Home page (show all or searched products)
    @GetMapping({"/home"})
    public String home(@RequestParam(required = false) String q, Model model) {
        List<Product> products;

        if (q == null || q.trim().isEmpty()) {
            products = productRepository.findAll();  // show all if no search
        } else {
            products = productRepository.findByNameContainingIgnoreCase(q.trim()); // filter
        }

        model.addAttribute("products", products);
        model.addAttribute("searchQuery", q);
        return "home"; // home.jsp / home.html
    }

    // List all products (separate page if needed)
    @GetMapping("/products")
    public String list(Model model) {
        model.addAttribute("products", productRepository.findAll());
        return "products";
    }

    // Product details by id
    @GetMapping("/products/{id}")
    public String detail(@PathVariable Long id, Model model) {
        Product product = productRepository.findById(id).orElse(null);
        if (product == null) return "redirect:/home";
        model.addAttribute("product", product);
        return "product_detail";
    }
}
