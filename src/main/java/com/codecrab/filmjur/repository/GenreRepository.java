package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GenreRepository extends JpaRepository<Genre, Long> {
    Genre findByTitle(String title);
    List<Genre> findAllOrderBy();
}