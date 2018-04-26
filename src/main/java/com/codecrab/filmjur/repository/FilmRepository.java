package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Film;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FilmRepository extends CrudRepository<Film, Long>{
    Film findByTitle(String title);
    List<Film> findAllOrderBy();

}
