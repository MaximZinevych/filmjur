package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.Film;
import com.codecrab.filmjur.service.FilmService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/api")
public class FilmController {

    Logger logger = LoggerFactory.getLogger(FilmController.class);

    @Autowired
    private FilmService filmService;

    @RequestMapping(value = "/films/", method = RequestMethod.GET)
    public ResponseEntity<List<Film>> listAllProductionCompanies(){
        logger.info("Fetching all Films.");
        List<Film> films = filmService.findAllFilms();
        if(films.isEmpty()){
            logger.error("No films has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(films, HttpStatus.OK);
    }
}
