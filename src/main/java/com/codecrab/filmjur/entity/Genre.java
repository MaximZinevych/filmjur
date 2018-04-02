package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Data @NoArgsConstructor
@Entity
@Table(schema = "film", name = "genre")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Genre implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

}
