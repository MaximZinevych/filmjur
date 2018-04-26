package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.HAward;
import com.codecrab.filmjur.repository.AwardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("awardService")
@Transactional
public class AwardServiceImpl implements AwardService {

    @Autowired
    AwardRepository awardRepository;

    @Override
    public HAward findById(Long id) {
        return awardRepository.findById(id).isPresent() ? awardRepository.findById(id).get() : null;
    }

    @Override
    public HAward findByTitle(String title) {
        return awardRepository.findByTitle(title);
    }

    @Override
    public void saveAward(HAward HAward) {
        awardRepository.save(HAward);
    }

    @Override
    public void updateAward(HAward HAward) {
        awardRepository.save(HAward);
    }

    @Override
    public void deleteAwardById(Long id) {
        awardRepository.deleteById(id);
    }

    @Override
    public List<HAward> findAllAwards() {
        return awardRepository.findAllOrderBy();
    }

    @Override
    public boolean isAwardExist(HAward HAward) {
        return findByTitle(HAward.getTitle()) != null;
    }
}
