package com.codecrab.filmjur.entity;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data @NoArgsConstructor
@Entity @Table(schema = "zoning", name = "countries")
public class Country {

    @Id
    @Column(name = "country_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id ;

    @Column(name = "country_name")
    private String countryName;

    @Column(name = "country_code")
    private String countryCode;
}
