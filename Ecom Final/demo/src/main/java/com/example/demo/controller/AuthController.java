package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/index")
    public String showRegisterPage() {
        return "index"; // register.jsp
    }
    

   @PostMapping("/index")
    public String handleRegister(@RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String role,
                             Model model) {

    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    String hashedPassword = encoder.encode(password);

    User user = new User();
    user.setUsername(username);
    user.setPassword(hashedPassword);
    user.setRole(role);

    userRepository.save(user);

    // Add success message to show in JSP
    model.addAttribute("message", "Registration successful! Please login.");

    return "index"; // stay on index.jsp
}

    
}
