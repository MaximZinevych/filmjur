package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Data
@NoArgsConstructor
@Entity
@Table(schema = "staff", name = "human")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@NamedQuery(name = "Human.findAllOrderBy", query = "SELECT h FROM Human h ORDER BY h.id")
public class Human{

    @Id
    @Column(name = "human_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String surname;
    private LocalDate birthdate;

//    @ManyToOne
//    @JoinColumn(name = "born_country")
//    private Country bornCountry;

//    @ManyToOne
//    @JoinColumn(name = "live_country")
//    private Country liveCountry;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "born_country")
    private Country bornCountry;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "live_country")
    private Country liveCountry;

    @Column(name = "year_active")
    private LocalDate yearActive;
    private String biography;
    private String description;
    private Long imdb;

}