package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.ProductionCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductionCompanyRepository extends JpaRepository<ProductionCompany, Long> {
    ProductionCompany findByTitle(String title);
    List<ProductionCompany> findAllOrderBy();
}
