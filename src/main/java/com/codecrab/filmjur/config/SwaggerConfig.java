package com.codecrab.filmjur.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket filmjurApi(){
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.codecrab.filmjur.controller"))
                .build()
                .apiInfo(metaData());
    }

    private ApiInfo metaData(){
        ApiInfo apiInfo = new ApiInfo(
                "Filmjur REST API",
                "Filmjur REST API for developers",
                "1.0",
                "Terms of service",
                "Maxim Zinevych",
                "Apache License Version 2.0",
                "https://www.apache.org/licenses/LICENSE-2.0");
        return apiInfo;
    }

}
