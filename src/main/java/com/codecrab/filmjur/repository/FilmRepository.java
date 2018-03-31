package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Film;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FilmRepository extends CrudRepository<Film, Long>{
}
