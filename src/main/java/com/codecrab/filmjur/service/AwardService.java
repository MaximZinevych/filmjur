package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.HAward;

import java.util.List;

public interface AwardService {
    HAward findById(Long id);
    HAward findByTitle(String title);
    void saveAward(HAward HAward);
    void updateAward(HAward HAward);
    void deleteAwardById(Long id);
    List<HAward> findAllAwards();
    boolean isAwardExist(HAward HAward);
}
