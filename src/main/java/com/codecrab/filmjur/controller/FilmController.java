package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.Film;
import com.codecrab.filmjur.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api")
public class FilmController {

    @Autowired
    private FilmService filmService;

    @ResponseBody
    @GetMapping(path = "/getAllFilms")
    public List<Film> getAllFilms(){
        return  filmService.findAll();
    }
}
