package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Genre;

import java.util.List;

public interface GenreService {

    Genre findById(Long id);
    Genre findByTitle(String title);
    void saveGenre(Genre genre);
    void updateGenre(Genre genre);
    void deleteGenreById(Long id);
    List<Genre> findAllGenres();
    boolean isGenreExist(Genre genre);
}
