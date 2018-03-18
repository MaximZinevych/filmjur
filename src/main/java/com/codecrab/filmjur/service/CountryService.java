package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Country;
import com.codecrab.filmjur.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CountryService implements ICountryService {

    @Autowired
    private CountryRepository repository;

    @Override
    public List<Country> findAll() {
        List<Country> countries = (List<Country>) repository.findAll();
        return countries;
    }
}
