package com.codecrab.filmjur.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data @NoArgsConstructor
@Entity @Table(schema = "film", name = "film")
public class Film{

    @Id @Column(name = "id")
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
}
