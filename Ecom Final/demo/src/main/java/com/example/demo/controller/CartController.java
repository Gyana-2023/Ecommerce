package com.example.demo.controller;

import com.example.demo.model.CartItem;
import com.example.demo.model.Product;
import com.example.demo.repository.CartItemRepository;
import com.example.demo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired private ProductRepository productRepository;
    @Autowired private CartItemRepository cartItemRepository;

    @GetMapping
    public String viewCart(Model model){
        List<CartItem> cartItems = cartItemRepository.findAll();
        double total = cartItems.stream().mapToDouble(CartItem::getTotalPrice).sum();
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", total);
        return "cart";
    }

    @GetMapping("/add/{productId}")
    public String addToCart(@PathVariable Long productId){
        Product product = productRepository.findById(productId).orElse(null);
        if(product == null) return "redirect:/products";

        CartItem existing = cartItemRepository.findByProductId(productId);
        if(existing != null){
            existing.setQuantity(existing.getQuantity() + 1);
            cartItemRepository.save(existing);
        } else {
            cartItemRepository.save(new CartItem(product, 1));
        }
        return "redirect:/cart";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable Long id){
        cartItemRepository.deleteById(id);
        return "redirect:/cart";
    }
}
