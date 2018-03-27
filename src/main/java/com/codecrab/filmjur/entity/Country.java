package com.codecrab.filmjur.entity;


import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
@Data @NoArgsConstructor
@Entity @Table(schema = "zoning", name = "countries")
public class Country {

    @Id
    @Column(name = "country_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    @ApiModelProperty(notes = "The database generated country ID")
    private Long id ;

    @Column(name = "country_name")
    @ApiModelProperty(notes = "The name of the current country" , required = true)
    private String countryName;

    @Column(name = "country_code")
    @ApiModelProperty(notes = "The code of the current country", required = true)
    private String countryCode;
}
