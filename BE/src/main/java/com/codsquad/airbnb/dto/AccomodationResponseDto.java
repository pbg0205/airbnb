package com.codsquad.airbnb.dto;

import com.codsquad.airbnb.domain.Image;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@ToString
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class AccomodationResponseDto {

    @JsonProperty("accomodation_id")
    private Long id;

    private String area;

    private List<Image> imageUrl;

    private String residentialType;

    private String accomodationName;

    private int maxMemberCapacity;

    private int bedRoomCount;

    private int bedCount;

    private int bathRoomCount;

    private List<String> options;

    private int pricePerDay;

    private int totalPrice;

    private double averagePoint;

    private int reviewCount;

    private double latitude;

    private double longitude;
}
