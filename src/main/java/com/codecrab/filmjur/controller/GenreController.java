package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.Genre;
import com.codecrab.filmjur.service.GenreService;
import com.codecrab.filmjur.util.CustomErrorType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@RestController
@RequestMapping("/api")
public class GenreController {

    private static final Logger logger = LoggerFactory.getLogger(GenreController.class);

    @Autowired
    GenreService genreService;

    @RequestMapping(value = "/genres/", method = RequestMethod.GET)
    public ResponseEntity<List<Genre>> listAllGenres(){
        logger.info("Fetching all genres.");
        List<Genre> genres = genreService.findAllGenres();
        if(genres.isEmpty()){
            logger.error("No genres has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(genres, HttpStatus.OK);
    }

    @RequestMapping(value = "/genres/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getGenre(@PathVariable("id") long id){
        logger.info("Fetching genre with id {}.", id);
        Genre genre = genreService.findById(id);
        if(genre == null){
            logger.error("Genre with id {} not found.");
            return new ResponseEntity<>(new CustomErrorType("Genre with id " + id
                + " not found."), HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(genre, HttpStatus.OK);
    }

    @RequestMapping(value = "/genres/", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<?> addGenre(@RequestBody Genre genre, UriComponentsBuilder ucBuilder){
        logger.info("Adding Genre : {}", genre);

        if(genreService.isGenreExist(genre)){
            logger.error("Unable to add genre. A genre with title {} already exists", genre.getTitle());
            return new ResponseEntity<>(new CustomErrorType("Unable to add. Genre with title " + genre.getTitle()
                + " already exists."), HttpStatus.CONFLICT);
        }
        genreService.saveGenre(genre);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/api/genre/{id}").buildAndExpand(genre.getId()).toUri());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/genres/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updateGenre(@PathVariable("id") long id, @RequestBody Genre genre){
        logger.info("Updating genre with id {}", id);

        Genre currentGenre = genreService.findById(id);

        if(currentGenre == null){
            logger.error("Unable to update. Genre with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to update. Genre with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        currentGenre.setTitle(genre.getTitle());
        genreService.updateGenre(currentGenre);
        return new ResponseEntity<>(currentGenre, HttpStatus.OK);
    }

    @RequestMapping(value = "/genres/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deleteGenre(@PathVariable("id") long id){
        logger.info("Fetching & Deleting genre with id {}", id);

        Genre genre = genreService.findById(id);
        if(genre == null){
            logger.error("Unable to delete. Genre with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to delete. Genre with id" +
                   id + " not found."), HttpStatus.NOT_FOUND);
        }

        genreService.deleteGenreById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}
