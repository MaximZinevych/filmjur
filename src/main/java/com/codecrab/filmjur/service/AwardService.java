package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Award;

import java.util.List;

public interface AwardService {
    Award findById(Long id);
    Award findByTitle(String title);
    void saveAward(Award award);
    void updateAward(Award award);
    void deleteAwardById(Long id);
    List<Award> findAllAwards();
    boolean isAwardExist(Award award);
}
