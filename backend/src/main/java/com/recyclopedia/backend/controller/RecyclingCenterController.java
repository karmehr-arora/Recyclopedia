package com.recyclopedia.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.recyclopedia.backend.model.RecyclingCenter;
import com.recyclopedia.backend.service.RecyclingCenterService;

import java.util.List;

@RestController
@RequestMapping("/api/centers")
public class RecyclingCenterController {

    @Autowired
    private RecyclingCenterService service;

    @GetMapping
    public List<RecyclingCenter> getAll() {
        return service.getAll();
    }

    @PostMapping
    public RecyclingCenter create(@RequestBody RecyclingCenter r) {
        return service.create(r);
    }

    @PutMapping("/{id}")
    public RecyclingCenter update(@PathVariable Long id, @RequestBody RecyclingCenter r) {
        r.setID(id);
        return service.update(r);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }
}