package com.recyclopedia.backend.config;

import com.recyclopedia.backend.dto.ApiMessage;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

@RestControllerAdvice
public class ApiExceptionHandler {
    @ExceptionHandler(DataIntegrityViolationException.class)
    @ResponseStatus(HttpStatus.CONFLICT)
    public ApiMessage conflict(DataIntegrityViolationException ex) {
        return new ApiMessage("email already exists");
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ApiMessage badRequest(MethodArgumentNotValidException ex) {
        return new ApiMessage("invalid input");
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ApiMessage fallback(RuntimeException ex) {
        return new ApiMessage(ex.getMessage());
    }
}
