package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Award;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AwardRepository extends JpaRepository<Award, Long>{
    Award findByTitle(String title);
    List<Award> findAllOrderBy();
}
