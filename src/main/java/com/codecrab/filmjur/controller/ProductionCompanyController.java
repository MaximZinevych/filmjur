package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.ProductionCompany;
import com.codecrab.filmjur.service.ProductionCompanyService;
import com.codecrab.filmjur.util.CustomErrorType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ProductionCompanyController {

    private static final Logger logger = LoggerFactory.getLogger(GenreController.class);

    @Autowired
    ProductionCompanyService productionCompanyService;

    @RequestMapping(value = "/production/company/", method = RequestMethod.GET)
    public ResponseEntity<List<ProductionCompany>> listAllProductionCompanies(){
        logger.info("Fetching all Production Companies.");
        List<ProductionCompany> productionCompanies = productionCompanyService.findAllProductionCompanies();
        if(productionCompanies.isEmpty()){
            logger.error("No production companies has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(productionCompanies, HttpStatus.OK);
    }

    @RequestMapping(value = "/production/company/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getProductionCompany(@PathVariable("id") long id){
        logger.info("Fetching production company with id {}.", id);
        ProductionCompany productionCompany = productionCompanyService.findById(id);
        if(productionCompany == null){
            logger.error("Production company with id {} not found.");
            return new ResponseEntity<>(new CustomErrorType("Production company with id " + id
                    + " not found."), HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(productionCompany, HttpStatus.OK);
    }

    @RequestMapping(value = "/production/company/", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<?> addProductionCompany(@RequestBody ProductionCompany productionCompany,
                                                  UriComponentsBuilder ucBuilder){
        logger.info("Adding production company : {}", productionCompany);

        if(productionCompanyService.isProductionCompanyExist(productionCompany)){
            logger.error("Unable to add production company. A production company with title {} already exists"
                    , productionCompany.getTitle());
            return new ResponseEntity<>(new CustomErrorType("Unable to add. Genre with title "
                    + productionCompany.getTitle() + " already exists."), HttpStatus.CONFLICT);
        }
        productionCompanyService.saveProductionCompany(productionCompany);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/production/company/{id}")
                .buildAndExpand(productionCompany.getId()).toUri());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/production/company/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updateProductionCompany(@PathVariable("id") long id,
                                                    @RequestBody ProductionCompany productionCompany){
        logger.info("Updating production company with id {}", id);

        ProductionCompany currentProductionCompany = productionCompanyService.findById(id);

        if(currentProductionCompany == null){
            logger.error("Unable to update. Production company with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to update. " +
                    "Production company with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        currentProductionCompany.setTitle(productionCompany.getTitle());
        currentProductionCompany.setCountry(productionCompany.getCountry());
        productionCompanyService.updateProductionCompany(currentProductionCompany);
        return new ResponseEntity<>(currentProductionCompany, HttpStatus.OK);
    }

    @RequestMapping(value = "/production/company/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deleteGenre(@PathVariable("id") long id){
        logger.info("Fetching & Deleting production company with id {}", id);

        ProductionCompany productionCompany = productionCompanyService.findById(id);
        if(productionCompany == null){
            logger.error("Unable to delete. Production company with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to delete. " +
                    "Production company with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        productionCompanyService.deleteProductionCompanyById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}
