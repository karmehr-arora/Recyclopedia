package com.recyclopedia.backend.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.recyclopedia.backend.model.RecyclingCenter;

@Repository
public interface RecyclingCenterRepository extends JpaRepository<RecyclingCenter, Long>{
}
