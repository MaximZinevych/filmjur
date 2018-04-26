package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Film;
import com.codecrab.filmjur.repository.FilmRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service("filmService")
public class FilmServiceImpl implements FilmService {

    @Autowired
    private FilmRepository filmRepository;

    @Override
    public Film findById(Long id) {
        return filmRepository.findById(id).isPresent() ? filmRepository.findById(id).get() : null;
    }

    @Override
    public Film findByTitle(String title) {
        return filmRepository.findByTitle(title);
    }

    @Override
    public void saveFilm(Film film) {
        filmRepository.save(film);
    }



    @Override
    public void updateFilm(Film film) {
        filmRepository.save(film);
    }

    @Override
    public void deleteFilmById(Long id) {
        filmRepository.deleteById(id);
    }

    @Override
    public List<Film> findAllFilms() {
        List<Film> films = new LinkedList<>();
        for(Film film:filmRepository.findAll()){
            films.add(film);
        }
        return films;
    }

    @Override
    public boolean isFilmExist(Film film) {
        return filmRepository.findByTitle(film.getTitle()) != null;
    }
}
