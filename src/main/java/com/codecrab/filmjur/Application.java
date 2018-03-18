package com.codecrab.filmjur;

import com.codecrab.filmjur.service.CountryService;
import com.codecrab.filmjur.service.ICountryService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public ICountryService helloService(){
        return new CountryService();
    }

}
