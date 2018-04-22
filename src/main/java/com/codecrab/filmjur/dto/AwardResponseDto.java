package com.codecrab.filmjur.dto;

import com.codecrab.filmjur.entity.Country;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class AwardResponseDto {
    private Long id;
    private String title;
    private Country country;
}
