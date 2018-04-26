package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Company;
import com.codecrab.filmjur.repository.ProductionCompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("productionCompanySrvice")
@Transactional
public class ProductionCompanyServiceImpl implements ProductionCompanyService{

    @Autowired
    ProductionCompanyRepository productionCompanyRepository;

    @Override
    public Company findById(Long id) {
        return productionCompanyRepository
                .findById(id).isPresent() ? productionCompanyRepository.findById(id).get() : null;
    }

    @Override
    public Company findByTitle(String title) {
        return productionCompanyRepository.findByTitle(title);
    }

    @Override
    public void saveProductionCompany(Company company) {
        productionCompanyRepository.save(company);
    }

    @Override
    public void updateProductionCompany(Company company) {
        productionCompanyRepository.save(company);
    }

    @Override
    public void deleteProductionCompanyById(Long id) {
        productionCompanyRepository.deleteById(id);
    }

    @Override
    public List<Company> findAllProductionCompanies() {
        return productionCompanyRepository.findAllOrderBy();
    }

    @Override
    public boolean isProductionCompanyExist(Company company) {
        return findByTitle(company.getTitle()) != null;
    }
}
