package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductionCompanyRepository extends JpaRepository<Company, Long> {
    Company findByTitle(String title);
    List<Company> findAllOrderBy();
}
