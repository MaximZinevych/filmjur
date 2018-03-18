package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Country;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends CrudRepository<Country, Long>{
}
