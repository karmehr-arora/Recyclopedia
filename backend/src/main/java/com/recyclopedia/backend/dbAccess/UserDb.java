package com.recyclopedia.backend.dbAccess;

import com.recyclopedia.backend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDb extends JpaRepository<User, Long> {
}