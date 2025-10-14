package com.example.demo.controller;

import com.example.demo.model.Product;
import com.example.demo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.net.URL;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/products")
public class AdminProductController {

    @Autowired
    private ProductRepository productRepository;

    private final String uploadDir = "src/main/resources/static/images/products";

    // ✅ List all products (Admin view)
    @GetMapping
    public String listProducts(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "admin_products"; // admin_products.jsp
    }

    // ✅ Show Add Product Form
    @GetMapping("/add")
    public String showAddProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin_product_add"; // admin_product_add.jsp
    }

    // ✅ Handle Add Product
    @PostMapping("/add")
    public String addProduct(@ModelAttribute Product product,
                             @RequestParam("imageUrl") String imageUrl) {

        if (imageUrl != null && !imageUrl.isBlank()) {
            String imageFileName = saveImageFromUrl(imageUrl);
            if (imageFileName != null) {
                product.setImageUrl("/images/products/" + imageFileName);
            }
        }

        productRepository.save(product);
        return "redirect:/admin/products"; // Back to admin product list
    }

    // ✅ Delete Product
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productRepository.deleteById(id);
        return "redirect:/admin/products";
    }

    // 📌 Save image from URL locally
    private String saveImageFromUrl(String imageUrl) {
        try {
            String ext = getExtension(imageUrl);
            if (ext == null || ext.isEmpty()) ext = "jpg";

            String fileName = UUID.randomUUID().toString() + "." + ext;
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) uploadPath.mkdirs();

            File dest = new File(uploadPath, fileName);
            try (InputStream in = new URL(imageUrl).openStream();
                 OutputStream out = new FileOutputStream(dest)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = in.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
            return fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 📌 Extract file extension from image URL
    private String getExtension(String filename) {
        if (filename == null) return "";
        String cleanName = filename.split("\\?")[0]; // remove query params
        int dotIndex = cleanName.lastIndexOf('.');
        return (dotIndex >= 0) ? cleanName.substring(dotIndex + 1) : "";
    }
}
