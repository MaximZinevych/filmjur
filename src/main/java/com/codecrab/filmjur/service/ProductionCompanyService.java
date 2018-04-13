package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.ProductionCompany;

import java.util.List;

public interface ProductionCompanyService {

    ProductionCompany findById(Long id);
    ProductionCompany findByTitle(String title);
    void saveProductionCompany(ProductionCompany productionCompany);
    void updateProductionCompany(ProductionCompany productionCompany);
    void deleteProductionCompanyById(Long id);
    List<ProductionCompany> findAllProductionCompanies();
    boolean isProductionCompanyExist(ProductionCompany productionCompany);
}
