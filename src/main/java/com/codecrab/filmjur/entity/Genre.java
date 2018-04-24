package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data @NoArgsConstructor
@Entity
@Table(schema = "film", name = "genre")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@NamedQuery(name = "Genre.findAllOrderBy", query = "SELECT g FROM Genre g ORDER BY g.id")
public class Genre implements Serializable {

    @Id @Column(name = "genre_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;


    @ManyToMany(mappedBy = "genres")
    private Set<Film> films = new HashSet<>();
}
