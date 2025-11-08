package com.recyclopedia.backend.controller;

import com.recyclopedia.backend.dto.*;
import com.recyclopedia.backend.service.AuthService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    private final AuthService auth;
    public AuthController(AuthService auth){ this.auth = auth; }

    @PostMapping("/signup")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiMessage signup(@RequestBody @Valid SignupRequest req) {
        auth.signup(req);
        return new ApiMessage("account created");
    }

    @PostMapping("/login")
    public ApiMessage login(@RequestBody @Valid LoginRequest req) {
        boolean ok = auth.login(req);
        if (!ok) throw new UnauthorizedException("invalid credentials");
        return new ApiMessage("login ok");
    }

    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    static class UnauthorizedException extends RuntimeException {
        public UnauthorizedException(String m){ super(m); }
    }
}