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

    public AuthService(UserRepository users) {
        this.users = users;
    }

    public void signup(SignupRequest req) {
        // use getters; normalize email
        final String email = req.getEmail().trim().toLowerCase();
        final String name  = req.getName().trim();
        final String raw   = req.getPassword();

        if (users.findByEmail(email).isPresent()) {
            throw new DataIntegrityViolationException("email already exists");
        }

        final String hash = encoder.encode(raw);
        users.save(new User(name, email, hash));
    }

    public boolean login(LoginRequest req) {
        final String email = req.getEmail().trim().toLowerCase();
        final String raw   = req.getPassword();

        return users.findByEmail(email)
                .map(u -> encoder.matches(raw, u.getPasswordHash()))
                .orElse(false);
    }
}
