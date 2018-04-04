package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Country;
import com.codecrab.filmjur.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("countryService")
@Transactional
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryRepository countryRepository;

    @Override
    public Country findById(Long id) {
        return countryRepository.findById(id).isPresent() ? countryRepository.findById(id).get() : null;
    }

    @Override
    public Country findByTitle(String title) {
        return countryRepository.findByTitle(title);
    }

    @Override
    public void saveCountry(Country country) {
        countryRepository.save(country);
    }

    @Override
    public void updateCountry(Country country) {
        countryRepository.save(country);
    }

    @Override
    public void deleteCountryById(Long id) {
        countryRepository.deleteById(id);
    }

    @Override
    public List<Country> findAllCountries() {
        return countryRepository.findAllOrderBy();
    }

    @Override
    public boolean isCountryExist(Country country) {
        return findByTitle(country.getTitle()) != null;
    }
}
