package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.ProductionCompany;
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
    public ProductionCompany findById(Long id) {
        return productionCompanyRepository
                .findById(id).isPresent() ? productionCompanyRepository.findById(id).get() : null;
    }

    @Override
    public ProductionCompany findByTitle(String title) {
        return productionCompanyRepository.findByTitle(title);
    }

    @Override
    public void saveProductionCompany(ProductionCompany productionCompany) {
        productionCompanyRepository.save(productionCompany);
    }

    @Override
    public void updateProductionCompany(ProductionCompany productionCompany) {
        productionCompanyRepository.save(productionCompany);
    }

    @Override
    public void deleteProductionCompanyById(Long id) {
        productionCompanyRepository.deleteById(id);
    }

    @Override
    public List<ProductionCompany> findAllProductionCompanies() {
        return productionCompanyRepository.findAllOrderBy();
    }

    @Override
    public boolean isProductionCompanyExist(ProductionCompany productionCompany) {
        return findByTitle(productionCompany.getTitle()) != null;
    }
}
