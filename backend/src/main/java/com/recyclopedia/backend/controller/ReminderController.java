package com.recyclopedia.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.recyclopedia.backend.model.Reminder;
import com.recyclopedia.backend.service.ReminderService;

import java.util.List;

@RestController
@RequestMapping("/api/reminders")
public class ReminderController {

    @Autowired
    private ReminderService service;

    @GetMapping
    public List<Reminder> getAll() {
        return service.getAll();
    }

    @PostMapping
    public Reminder create(@RequestBody Reminder r) {
        return service.create(r);
    }

    @PutMapping("/{id}")
    public Reminder update(@PathVariable String id, @RequestBody Reminder r) {
        r.setId(id);
        return service.update(r);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        service.delete(id);
    }
}