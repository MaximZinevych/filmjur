package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Country;

import java.util.List;

public interface CountryService {
    Country findById(Long id);
    Country findByTitle(String name);
    void saveCountry(Country user);
    void updateCountry(Country user);
    void deleteCountryById(Long id);
    List<Country> findAllCountries();
    boolean isCountryExist(Country genre);
}
