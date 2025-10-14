package com.example.demo.controller;

import com.example.demo.model.*;
import com.example.demo.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class OrderController {

    @Autowired private ProductRepository productRepository;
    @Autowired private CartItemRepository cartItemRepository;
    @Autowired private OrderRepository orderRepository;

    // ✅ Buy Now -> checkout page
    @GetMapping("/buy/{productId}")
    public String buyNow(@PathVariable Long productId, Model model){
        Product product = productRepository.findById(productId).orElse(null);
        if(product == null) return "redirect:/products";
        model.addAttribute("product", product);
        model.addAttribute("quantity", 1);
        return "checkout";
    }

    // ✅ Checkout for entire cart
    @GetMapping("/checkout/cart")
    public String checkoutCart(Model model) {
        List<CartItem> cartItems = cartItemRepository.findAll();
        if (cartItems.isEmpty()) {
            return "redirect:/cart"; // No items, go back
        }

        double total = cartItems.stream().mapToDouble(CartItem::getTotalPrice).sum();
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", total);
        return "checkout"; // Same JSP used for both single & cart checkout
    }

    // ✅ Confirm Buy Now
    @PostMapping("/checkout/confirm")
    public String confirmSingle(@RequestParam Long productId,
                                @RequestParam int quantity,
                                @RequestParam String customerName,
                                @RequestParam String address,
                                @RequestParam String phone,
                                @RequestParam(required=false) String email) {
        Product product = productRepository.findById(productId).orElse(null);
        if (product == null || quantity <= 0) {
            return "redirect:/order-success?status=failed";
        }

        double total = product.getPrice() * quantity;
        Order order = new Order(customerName, address, phone, email, total);
        OrderItem item = new OrderItem(product, quantity, product.getPrice());
        order.addItem(item);

        orderRepository.save(order);

        return "redirect:/order-success?status=success&orderId=" + order.getId();
    }

    // ✅ Confirm Cart Checkout
    @PostMapping("/checkout/cart-confirm")
    public String confirmCart(@RequestParam String customerName,
                              @RequestParam String address,
                              @RequestParam String phone,
                              @RequestParam(required=false) String email) {
        List<CartItem> cartItems = cartItemRepository.findAll();
        if(cartItems.isEmpty()) {
            return "redirect:/order-success?status=failed";
        }

        double total = cartItems.stream().mapToDouble(CartItem::getTotalPrice).sum();
        Order order = new Order(customerName, address, phone, email, total);

        for(CartItem ci : cartItems){
            OrderItem oi = new OrderItem(ci.getProduct(), ci.getQuantity(), ci.getProduct().getPrice());
            order.addItem(oi);
        }

        orderRepository.save(order);
        cartItemRepository.deleteAll();

        return "redirect:/order-success?status=success&orderId=" + order.getId();
    }

    // ✅ Order success page
    @GetMapping("/order-success")
    public String orderSuccess(@RequestParam String status,
                               @RequestParam(required = false) Long orderId,
                               Model model) {
        if ("success".equals(status) && orderId != null) {
            Order order = orderRepository.findById(orderId).orElse(null);
            model.addAttribute("order", order);
        }
        model.addAttribute("status", status);
        return "order-success";
    }

    // ✅ My Orders (user view)
    @GetMapping("/my-orders")
    public String myOrders(@RequestParam(required=false) String email,
                           @RequestParam(required=false) String customerName,
                           Model model){
        List<Order> orders;
        if(email != null && !email.isBlank()){
            orders = orderRepository.findByEmail(email);
        } else if(customerName != null && !customerName.isBlank()){
            orders = orderRepository.findByCustomerName(customerName);
        } else {
            orders = orderRepository.findAll(); // fallback (later link with logged-in user)
        }
        model.addAttribute("orders", orders);
        return "my-orders";
    }
}
