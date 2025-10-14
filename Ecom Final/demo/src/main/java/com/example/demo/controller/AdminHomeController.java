package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {

    // ✅ After admin login, redirect to admin product management
    @GetMapping("/admin")
    public String adminHome() {
        return "redirect:/admin/products";  // goes to ProductController
    }
}
