package com.recyclopedia.backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.recyclopedia.backend.model.Reminder;

@Repository
public interface ReminderRepository extends JpaRepository<Reminder, String> {
}