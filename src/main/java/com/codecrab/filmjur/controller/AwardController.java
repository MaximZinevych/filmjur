package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.HAward;
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

import java.util.List;

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
    public ResponseEntity<List<HAward>> getAwards(){
        logger.info("Fetching all HAwards.");
        List<HAward> HAwards = awardService.findAllAwards();
//        List<AwardResponseDto> awardResponseDtos = new ArrayList<>();
//        for (HAward award : HAwards){
//            awardResponseDtos.add(convertToDto(award));
//        }
        if(HAwards.isEmpty()){
            logger.error("No award has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(HAwards, HttpStatus.OK);
    }

    @RequestMapping(value = "/awards/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getAward(@PathVariable("id") long id){
        logger.info("Fetching HAward with id {}.", id);
        HAward HAward = awardService.findById(id);



        if(HAward == null){
            logger.error("HAward with id {} not found.");
            return new ResponseEntity<>(new CustomErrorType("HAward with id " + id
                    + " not found."), HttpStatus.NOT_FOUND);
        }

//        AwardResponseDto awardDto = convertToDto(HAward);
        return new ResponseEntity<>(HAward, HttpStatus.OK);
    }

    @RequestMapping(value = "/awards/", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<?> addAward(@RequestBody HAward HAward, UriComponentsBuilder ucBuilder){
        logger.info("Adding HAward : {}", HAward);

        HAward local = new HAward();

        local.setTitle(HAward.getTitle());
        local.setCountry(countryService.findById(HAward.getCountry().getId()));


        if(awardService.isAwardExist(local)){
            logger.error("Unable to add HAward. A HAward with title {} already exists", HAward.getTitle());
            return new ResponseEntity<>(new CustomErrorType("Unable to add. Genre with title " + HAward.getTitle()
                    + " already exists."), HttpStatus.CONFLICT);
        }
        awardService.saveAward(local);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/api/countries/{id}").buildAndExpand(local.getId()).toUri());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/awards/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updateAward(@PathVariable("id") long id, @RequestBody HAward HAward){
        logger.info("Updating HAward with id {}", id);

        HAward currentHAward = awardService.findById(id);

        if(currentHAward == null){
            logger.error("Unable to update. HAward with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to update. HAward with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        currentHAward.setTitle(HAward.getTitle());
        currentHAward.setCountry(countryService.findById(HAward.getId()));
        awardService.updateAward(currentHAward);
        return new ResponseEntity<>(currentHAward, HttpStatus.OK);
    }

    @RequestMapping(value = "/awards/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deleteAward(@PathVariable("id") long id){
        logger.info("Fetching & Deleting HAward with id {}", id);

        HAward HAward = awardService.findById(id);
        if(HAward == null){
            logger.error("Unable to delete. HAward with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to delete. HAward with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        awardService.deleteAwardById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

//    private AwardResponseDto convertToDto(HAward award){
//        AwardResponseDto dto = modelMapper.map(award, AwardResponseDto.class);
//        if(award.getCountry() != null){
//            dto.setCountry(Optional.of(award.getCountry().getTitle()));
//        }
//        return dto;
//    }
}
