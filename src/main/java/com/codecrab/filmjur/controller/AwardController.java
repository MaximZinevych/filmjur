package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.dto.AwardRequestDto;
import com.codecrab.filmjur.dto.AwardResponseDto;
import com.codecrab.filmjur.entity.Award;
import com.codecrab.filmjur.service.AwardService;
import com.codecrab.filmjur.service.CountryService;
import com.codecrab.filmjur.util.CustomErrorType;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/api")
public class AwardController {

    private static final Logger logger = LoggerFactory.getLogger(GenreController.class);

    @Autowired
    AwardService awardService;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    CountryService countryService;

    @RequestMapping(value = "/awards/", method = RequestMethod.GET)
    public ResponseEntity<List<Award>> getAwards(){
        logger.info("Fetching all awards.");
        List<Award> awards = awardService.findAllAwards();
//        List<AwardResponseDto> awardResponseDtos = new ArrayList<>();
//        for (Award award : awards){
//            awardResponseDtos.add(convertToDto(award));
//        }
        if(awards.isEmpty()){
            logger.error("No award has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(awards, HttpStatus.OK);
    }

    @RequestMapping(value = "/awards/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getAward(@PathVariable("id") long id){
        logger.info("Fetching award with id {}.", id);
        Award award = awardService.findById(id);



        if(award == null){
            logger.error("Award with id {} not found.");
            return new ResponseEntity<>(new CustomErrorType("Award with id " + id
                    + " not found."), HttpStatus.NOT_FOUND);
        }

//        AwardResponseDto awardDto = convertToDto(award);
        return new ResponseEntity<>(award, HttpStatus.OK);
    }

    @RequestMapping(value = "/awards/", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<?> addAward(@RequestBody Award award, UriComponentsBuilder ucBuilder){
        logger.info("Adding award : {}", award);

        Award local = new Award();

        local.setTitle(award.getTitle());
        local.setCountry(countryService.findById(award.getCountry().getId()));


        if(awardService.isAwardExist(local)){
            logger.error("Unable to add award. A award with title {} already exists", award.getTitle());
            return new ResponseEntity<>(new CustomErrorType("Unable to add. Genre with title " + award.getTitle()
                    + " already exists."), HttpStatus.CONFLICT);
        }
        awardService.saveAward(local);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/api/countries/{id}").buildAndExpand(local.getId()).toUri());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/awards/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updateAward(@PathVariable("id") long id, @RequestBody Award award){
        logger.info("Updating award with id {}", id);

        Award currentAward = awardService.findById(id);

        if(currentAward == null){
            logger.error("Unable to update. Award with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to update. Award with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        currentAward.setTitle(award.getTitle());
        currentAward.setCountry(countryService.findById(award.getId()));
        awardService.updateAward(currentAward);
        return new ResponseEntity<>(currentAward, HttpStatus.OK);
    }

    @RequestMapping(value = "/awards/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deleteAward(@PathVariable("id") long id){
        logger.info("Fetching & Deleting award with id {}", id);

        Award award = awardService.findById(id);
        if(award == null){
            logger.error("Unable to delete. Award with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to delete. Award with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        awardService.deleteAwardById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

//    private AwardResponseDto convertToDto(Award award){
//        AwardResponseDto dto = modelMapper.map(award, AwardResponseDto.class);
//        if(award.getCountry() != null){
//            dto.setCountry(Optional.of(award.getCountry().getTitle()));
//        }
//        return dto;
//    }
}
