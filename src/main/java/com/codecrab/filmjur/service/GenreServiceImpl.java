package com.codecrab.filmjur.service;


import java.util.List;


import com.codecrab.filmjur.entity.Genre;
import com.codecrab.filmjur.repository.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("genreService")
@Transactional
public class GenreServiceImpl implements GenreService {

    @Autowired
    private GenreRepository genreRepository;

    @Override
    public Genre findById(Long genreId) {
        return genreRepository.findById(genreId).isPresent() ? genreRepository.findById(genreId).get() : null;
    }

    @Override
    public Genre findByTitle(String title) {
        return genreRepository.findByTitle(title);
    }

    @Override
    public void saveGenre(Genre genre) {
        genreRepository.save(genre);
    }

    @Override
    public void updateGenre(Genre genre) {
        genreRepository.save(genre);
    }

    @Override
    public void deleteGenreById(Long id) {
        genreRepository.deleteById(id);
    }

    @Override
    public List<Genre> findAllGenres() {
        return genreRepository.findAllOrderBy();
    }

    @Override
    public boolean isGenreExist(Genre genre) {
        return findByTitle(genre.getTitle()) != null;
    }
}
