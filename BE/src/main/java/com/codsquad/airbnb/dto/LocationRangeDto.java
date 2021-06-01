package com.codsquad.airbnb.dto;

import lombok.Getter;

import java.beans.ConstructorProperties;

@Getter
public class LocationRangeDto {

    private double southWestLatitude;

    private double southWestlongitude;

    private double northEastLatitude;

    private double northEastLongitude;

    @ConstructorProperties({"sw_lat", "sw_lng", "ne_lat", "ne_lng"})
    public LocationRangeDto(double southWestLatitude, double southWestlongitude,
                            double northEastLatitude, double northEastLongitude) {
        this.southWestLatitude = southWestLatitude;
        this.southWestlongitude = southWestlongitude;
        this.northEastLatitude = northEastLatitude;
        this.northEastLongitude = northEastLongitude;
    }
}
