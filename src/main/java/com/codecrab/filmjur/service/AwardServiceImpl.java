package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Award;
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
    public Award findById(Long id) {
        return awardRepository.findById(id).isPresent() ? awardRepository.findById(id).get() : null;
    }

    @Override
    public Award findByTitle(String title) {
        return awardRepository.findByTitle(title);
    }

    @Override
    public void saveAward(Award award) {
        awardRepository.save(award);
    }

    @Override
    public void updateAward(Award award) {
        awardRepository.save(award);
    }

    @Override
    public void deleteAwardById(Long id) {
        awardRepository.deleteById(id);
    }

    @Override
    public List<Award> findAllAwards() {
        return awardRepository.findAllOrderBy();
    }

    @Override
    public boolean isAwardExist(Award award) {
        return findByTitle(award.getTitle()) != null;
    }
}
