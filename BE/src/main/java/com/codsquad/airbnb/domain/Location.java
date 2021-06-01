package com.codsquad.airbnb.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@Builder
public class Location {
    @Id
    private Long locationId;

    private String locationName;

    private String country;

    private String region;

    private String city;

    private double latitude;

    private double longitude;
}
