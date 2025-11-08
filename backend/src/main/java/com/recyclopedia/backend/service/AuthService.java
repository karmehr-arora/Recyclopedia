package com.recyclopedia.backend.service;

import com.recyclopedia.backend.dto.LoginRequest;
import com.recyclopedia.backend.dto.SignupRequest;
import com.recyclopedia.backend.model.User;
import com.recyclopedia.backend.repo.UserRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    private final UserRepository users;
    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public AuthService(UserRepository users){ this.users = users; }

    public void signup(SignupRequest req) {
        String email = req.email.toLowerCase();
        if (users.findByEmail(email).isPresent()) {
            throw new DataIntegrityViolationException("email already exists");
        }
        String hash = encoder.encode(req.password);
        users.save(new User(req.name, email, hash));
    }

    public boolean login(LoginRequest req) {
        return users.findByEmail(req.email.toLowerCase())
                .map(u -> encoder.matches(req.password, u.getPasswordHash()))
                .orElse(false);
    }
}