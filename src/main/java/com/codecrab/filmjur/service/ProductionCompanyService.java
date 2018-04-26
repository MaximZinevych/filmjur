package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Company;

import java.util.List;

public interface ProductionCompanyService {

    Company findById(Long id);
    Company findByTitle(String title);
    void saveProductionCompany(Company company);
    void updateProductionCompany(Company company);
    void deleteProductionCompanyById(Long id);
    List<Company> findAllProductionCompanies();
    boolean isProductionCompanyExist(Company company);
}
