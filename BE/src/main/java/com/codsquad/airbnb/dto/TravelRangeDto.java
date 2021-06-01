package com.codsquad.airbnb.dto;

import com.codsquad.airbnb.util.LocalDateUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.beans.ConstructorProperties;
import java.time.LocalDate;

@Getter
public class TravelRangeDto {

    private LocalDate checkInDate;

    private LocalDate checkOutDate;

    @ConstructorProperties({"check_in", "check_out"})
    public TravelRangeDto(String checkInDate, String checkOutDate) {
        this.checkInDate = LocalDateUtil.parseToLocalDate(checkInDate);
        this.checkOutDate = LocalDateUtil.parseToLocalDate(checkOutDate);
    }
}
