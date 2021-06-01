package com.codsquad.airbnb.dto;

import com.codsquad.airbnb.util.LocalDateUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.beans.ConstructorProperties;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@Getter
@Setter
@ToString
public class AccomodationRequestDto {
    private LocalDate checkInDate;
    private LocalDate checkOutDate;

    private int adults;
    private int children;
    private int infants;

    private int priceRangeMin;
    private int priceRangeMax;

    private double northEastLatitude;
    private double northEastLongitude;
    private double southWestLatitude;
    private double southWestLongitude;

    @ConstructorProperties({"check_in", "check_out", "adults", "children", "infants",
    "price_range_min", "price_range_max", "ne_lat", "ne_lng", "sw_lat", "sw_lng"})
    public AccomodationRequestDto(String checkInDate, String checkOutDate,
                                  int adults, int children, int infants,
                                  int priceRangeMin, int priceRangeMax,
                                  double northEastLatitude, double northEastLongitude,
                                  double southWestLatitude, double southWestLongitude) {
        this.checkInDate = LocalDateUtil.parseToLocalDate(checkInDate);
        this.checkOutDate = LocalDateUtil.parseToLocalDate(checkOutDate);
        this.adults = adults;
        this.children = children;
        this.infants = infants;
        this.priceRangeMin = priceRangeMin;
        this.priceRangeMax = priceRangeMax;
        this.northEastLatitude = northEastLatitude;
        this.northEastLongitude = northEastLongitude;
        this.southWestLatitude = southWestLatitude;
        this.southWestLongitude = southWestLongitude;
    }

    public int getTotalMemberCount() {
        return this.adults + this.children + this.infants;
    }
}
