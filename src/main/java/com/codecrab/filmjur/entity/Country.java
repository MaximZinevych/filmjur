package com.codecrab.filmjur.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;

@Data @NoArgsConstructor
@Entity @Table(schema = "zoning", name = "country")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@NamedQuery(name = "Country.findAllOrderBy", query = "SELECT c FROM Country c ORDER BY c.id")
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @ApiModelProperty(notes = "The database generated country ID")
    private Long id ;

    @Column(name = "title")
    @ApiModelProperty(notes = "The name of the current country" , required = true)
    private String title;

    @Column(name = "code")
    @ApiModelProperty(notes = "The code of the current country", required = true)
    private String code;

    public Country(Long id){
        this.setId(id);
    }
//
//    @OneToOne(fetch = FetchType.LAZY,
//        cascade = CascadeType.ALL,
//        mappedBy = "country")
//    private Award award;
}
