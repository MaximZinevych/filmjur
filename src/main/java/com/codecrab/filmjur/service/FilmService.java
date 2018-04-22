package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Film;

import java.util.List;

public interface FilmService {
    Film findById(Long id);
    Film findByTitle(String title);
    void saveFilm(Film film);
    void updateFilm(Film film);
    void deleteFilmById(Long id);
    List<Film> findAllFilms();
    boolean isFilmExist(Film film);
}
