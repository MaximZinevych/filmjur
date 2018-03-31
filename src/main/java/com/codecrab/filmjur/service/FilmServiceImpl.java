package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Film;
import com.codecrab.filmjur.repository.FilmRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class FilmServiceImpl implements com.codecrab.filmjur.service.FilmService {

    @Autowired
    private FilmRepository repository;

    @Override
    public List<Film> findAll() {
        return (List<Film>) repository.findAll();
    }
}
