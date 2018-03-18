package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.Country;
import com.codecrab.filmjur.service.ICountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CountryController {

    @Autowired
    ICountryService countryService;

    @ResponseBody @GetMapping(path = "/getAllCountries")
    public List<Country> getAllCountries(){
        List<Country> countryList = countryService.findAll();
        return countryList;
    }
}
