package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.HAward;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AwardRepository extends JpaRepository<HAward, Long>{
    HAward findByTitle(String title);
    List<HAward> findAllOrderBy();
}
