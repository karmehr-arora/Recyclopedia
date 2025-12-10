package com.recyclopedia.backend.service;

import com.recyclopedia.backend.model.Reminder;
import com.recyclopedia.backend.repo.ReminderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReminderService {

    @Autowired
    private ReminderRepository repo;

    public List<Reminder> getAll() {
        return repo.findAll();
    }

    public Reminder create(Reminder r) {
        return repo.save(r);
    }

    public Reminder update(Reminder r) {
        return repo.save(r);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}