package com.codsquad.airbnb.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@Builder
@ToString
public class Accomodation {
    @Id
    private Long accomodtionId;

    private Long locationId;

    private String accomodationName;

    private String hostName;

    private String discription;

    private String accomodationType;

    private int price;

    private int maximumOccupancy;

    private double averagePoint;

    private int bedRoom;

    private int bathRoom;

    private int bedCount;

    private String option;
}
