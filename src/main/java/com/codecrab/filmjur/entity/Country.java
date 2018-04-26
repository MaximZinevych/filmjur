package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.Set;

@Data @NoArgsConstructor
@Entity @Table(schema = "zoning", name = "country")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@NamedQuery(name = "Country.findAllOrderBy", query = "SELECT c FROM Country c ORDER BY c.id")
public class Country {

    @Id @Column(name = "country_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(notes = "The database generated country ID")
    private Long id ;

    @ApiModelProperty(notes = "The name of the current country" , required = true)
    private String title;

    @ApiModelProperty(notes = "The code of the current country", required = true)
    private String code;

    @ManyToOne
    @JoinColumn(name = "flag")
    private Image flag;

//    @OneToMany(mappedBy = "liveCountry")
//    private Set<Human> humanLiveCountry;

//    @OneToMany(mappedBy = "bornCountry")
//    private Set<Human> humanBornCountry;
}
