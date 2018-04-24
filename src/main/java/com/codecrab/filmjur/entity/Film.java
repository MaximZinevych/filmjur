package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data @NoArgsConstructor
@Entity @Table(schema = "film", name = "film")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@NamedQuery(name = "Film.findAllOrderBy", query = "SELECT f FROM Film f ORDER BY f.id")
public class Film{

    @Id @Column(name = "film_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "imdb")
    private Long imdb;

    @Column(name = "timestamp")
    private Date timestamp;

    @Column(name = "running_time")
    private short runningTime;

    @Column(name = "release_date")
    private short releaseDate;


    @ManyToMany
    @JsonIgnore
    @JoinTable(schema = "film",
            name = "film_genre",
            joinColumns = {@JoinColumn(name = "film_id")},
            inverseJoinColumns = {@JoinColumn(name = "genre_id")})
    private Set<Genre> genres = new HashSet<>();
}
