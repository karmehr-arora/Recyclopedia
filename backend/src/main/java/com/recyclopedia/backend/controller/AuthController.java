package com.recyclopedia.backend.controller;

import com.recyclopedia.backend.dto.ApiMessage;
import com.recyclopedia.backend.dto.LoginRequest;
import com.recyclopedia.backend.dto.SignupRequest;
import com.recyclopedia.backend.exception.UnauthorizedException;
import com.recyclopedia.backend.service.AuthService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

/** Authentication endpoints: /api/auth/signup, /api/auth/login */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService auth;

    public AuthController(AuthService auth) {
        this.auth = auth;
    }

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
}
