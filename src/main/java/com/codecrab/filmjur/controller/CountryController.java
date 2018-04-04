package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.Country;
import com.codecrab.filmjur.service.CountryService;
import com.codecrab.filmjur.util.CustomErrorType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@Controller
@RequestMapping("/api")
public class CountryController {

    private static final Logger logger = LoggerFactory.getLogger(GenreController.class);

    @Autowired
    CountryService countryService;

    @RequestMapping(value = "/countries/", method = RequestMethod.GET)
    public ResponseEntity<List<Country>> getCountries(){
        logger.info("Fetching all countries.");
        List<Country> countries = countryService.findAllCountries();
        if(countries.isEmpty()){
            logger.error("No countries has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(countries, HttpStatus.OK);
    }

    @RequestMapping(value = "/countries/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getCountry(@PathVariable("id") long id){
        logger.info("Fetching country with id {}.", id);
        Country country = countryService.findById(id);
        if(country == null){
            logger.error("Country with id {} not found.");
            return new ResponseEntity<>(new CustomErrorType("Country with id " + id
                    + " not found."), HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(country, HttpStatus.OK);
    }

    @RequestMapping(value = "/countries/", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<?> addCountry(@RequestBody Country country, UriComponentsBuilder ucBuilder){
        logger.info("Adding Country : {}", country);

        if(countryService.isCountryExist(country)){
            logger.error("Unable to add country. A country with title {} already exists", country.getTitle());
            return new ResponseEntity<>(new CustomErrorType("Unable to add. Genre with title " + country.getTitle()
                    + " already exists."), HttpStatus.CONFLICT);
        }
        countryService.saveCountry(country);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/api/countries/{id}").buildAndExpand(country.getId()).toUri());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/countries/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updateCountry(@PathVariable("id") long id, @RequestBody Country country){
        logger.info("Updating country with id {}", id);

        Country currentCountry = countryService.findById(id);

        if(currentCountry == null){
            logger.error("Unable to update. Country with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to update. Country with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        currentCountry.setTitle(country.getTitle());
        countryService.updateCountry(currentCountry);
        return new ResponseEntity<>(currentCountry, HttpStatus.OK);
    }

    @RequestMapping(value = "/countries/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deleteCountry(@PathVariable("id") long id){
        logger.info("Fetching & Deleting country with id {}", id);

        Country country = countryService.findById(id);
        if(country == null){
            logger.error("Unable to delete. Country with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to delete. Country with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        countryService.deleteCountryById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
