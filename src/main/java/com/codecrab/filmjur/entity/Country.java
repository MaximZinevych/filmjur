package com.codecrab.filmjur.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;

@Data @NoArgsConstructor
@Entity @Table(schema = "zoning", name = "country")
public class Country {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "production_company_id_seq")
    @SequenceGenerator(name = "production_company_id_seq", sequenceName = "production_company_id_seq")
    @ApiModelProperty(notes = "The database generated country ID")
    private Long id ;

    @Column(name = "title")
    @ApiModelProperty(notes = "The name of the current country" , required = true)
    private String countryName;

    @Column(name = "code")
    @ApiModelProperty(notes = "The code of the current country", required = true)
    private String countryCode;
}
