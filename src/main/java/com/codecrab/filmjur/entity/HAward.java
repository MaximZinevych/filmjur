package com.codecrab.filmjur.entity;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data @NoArgsConstructor
@Entity
@Table(schema = "misc", name = "haward")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@NamedQuery(name = "HAward.findAllOrderBy", query = "SELECT a FROM HAward a ORDER BY a.id")
public class HAward {

    @Id @Column(name = "haward_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    private String title;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country")
    private Country country;
}
