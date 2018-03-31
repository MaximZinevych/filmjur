package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Country;
import com.codecrab.filmjur.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CountryServiceImpl implements com.codecrab.filmjur.service.CountryService {

    @Autowired
    private CountryRepository repository;

    @Override
    public List<Country> findAll() {
        return (List<Country>) repository.findAll();
    }
}
