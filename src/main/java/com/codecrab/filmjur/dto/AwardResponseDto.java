package com.codecrab.filmjur.dto;

import com.codecrab.filmjur.service.AwardService;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Data @NoArgsConstructor
public class AwardResponseDto {
    private Long id;
    private String title;
    private Optional<String> country;


}
