package com.recyclopedia.backend.controller;

import com.recyclopedia.backend.dbAccess.UserDb;
import com.recyclopedia.backend.model.User;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController //handles HTTP requests
@RequestMapping("/api/users")
public class UserController {

    private final UserDb userRepository;

    public UserController(UserDb userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping //returns all users 
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @PostMapping //save new user
    public User addUser(@RequestBody User user) {
        return userRepository.save(user);
    }
}