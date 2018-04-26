package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.*;

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
    private LocalDate releaseDate;



    @OneToMany
    @JoinTable(name = "film_genre", schema = "film",
            joinColumns = @JoinColumn(name = "film_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id"))
    private List<Genre> genres = new LinkedList<>();

    @OneToMany
    @JoinTable(name = "film_company", schema = "film",
            joinColumns = @JoinColumn(name = "film_id"),
            inverseJoinColumns = @JoinColumn(name = "company_id"))
    private List<Company> companies = new LinkedList<>();

    @OneToMany
    @JoinTable(name = "film_faward", schema = "film",
            joinColumns = @JoinColumn(name = "film_id"),
            inverseJoinColumns = @JoinColumn(name = "faward_id"))
    private List<FAward> fawards = new LinkedList<>();

    @OneToMany
    @JoinTable(name = "film_human_role", schema = "film",
            joinColumns = @JoinColumn(name = "film_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles = new LinkedList<>();


}
