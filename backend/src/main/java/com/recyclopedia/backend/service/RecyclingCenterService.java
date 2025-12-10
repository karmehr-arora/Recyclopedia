package com.recyclopedia.backend.service;

import com.recyclopedia.backend.model.RecyclingCenter;
import com.recyclopedia.backend.model.RecyclingCenter;
import com.recyclopedia.backend.repo.RecyclingCenterRepository;
import com.recyclopedia.backend.repo.RecyclingCenterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecyclingCenterService {

    @Autowired
    private RecyclingCenterRepository repo;

    public List<RecyclingCenter> getAll() {
        return repo.findAll();
    }

    public RecyclingCenter create(RecyclingCenter r) {
        return repo.save(r);
    }

    public RecyclingCenter update(RecyclingCenter r) {
        return repo.save(r);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}