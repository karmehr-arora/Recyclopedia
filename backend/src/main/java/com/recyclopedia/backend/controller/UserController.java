package com.recyclopedia.backend.controller;

import org.springframework.web.bind.annotation.*;

@RestController 
@RequestMapping("/api/users")
@CrossOrigin(origins = "*") //allow flutter to connect
public class UserController {

    @GetMapping("/status")
    public String status() {
        return "Java is running";
    }
}