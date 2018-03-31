package com.codecrab.filmjur;

import com.codecrab.filmjur.service.FilmService;
import com.codecrab.filmjur.service.CountryService;
import com.codecrab.filmjur.service.CountryServiceImpl;
import com.codecrab.filmjur.service.FilmServiceImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CountryService countryService(){
        return new CountryServiceImpl();
    }

    @Bean
    public FilmService filmService(){
        return new FilmServiceImpl();
    }

}
