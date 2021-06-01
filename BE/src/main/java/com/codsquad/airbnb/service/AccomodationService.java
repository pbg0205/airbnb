package com.codsquad.airbnb.service;

import com.codsquad.airbnb.dao.AccomodationDao;
import com.codsquad.airbnb.domain.Accomodation;
import com.codsquad.airbnb.domain.Image;
import com.codsquad.airbnb.domain.Location;
import com.codsquad.airbnb.dto.AccomodationRequestDto;
import com.codsquad.airbnb.dto.AccomodationResponseDto;
import com.codsquad.airbnb.dto.LocationRangeDto;
import com.codsquad.airbnb.dto.TravelRangeDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AccomodationService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AccomodationService.class);

    private AccomodationDao accomodationDao;

    public AccomodationService(AccomodationDao accomodationDao) {
        this.accomodationDao = accomodationDao;
    }

    public List<AccomodationResponseDto> getResponseBySearchCondition(AccomodationRequestDto requestDto) {
        LOGGER.debug("AccomodationService.getResponseBySearchCondition");

        List<Accomodation> accomodationList = findAccomodationByUserRequest(requestDto);

        LOGGER.debug("accomodationList : {}", accomodationList);

        return convertAccomodationDto(accomodationList);
    }

    private List<AccomodationResponseDto> convertAccomodationDto(List<Accomodation> accomodationList) {
        return accomodationList.stream().map(accomodation
                -> {
            Location location = findLocationByLocationId(accomodation.getLocationId());
            List<Image> images = findImagesByAccomodationId(accomodation.getAccomodtionId());

            LOGGER.debug("{}", location);
            LOGGER.debug("{}", images);

            return AccomodationResponseDto.builder()
                    .id(accomodation.getAccomodtionId())
                    .area(getArea(location))
                    .imageUrl(images)
                    .accomodationName(accomodation.getAccomodationName())
                    .residentialType(accomodation.getAccomodationType())
                    .maxMemberCapacity(accomodation.getMaximumOccupancy())
                    .bedRoomCount(accomodation.getBedRoom())
                    .bathRoomCount(accomodation.getBathRoom())
                    .options(parseOptions(accomodation.getOption()))
                    .pricePerDay(accomodation.getPrice())
                    .averagePoint(accomodation.getAveragePoint())
                    .reviewCount(100)
                    .latitude(location.getLatitude())
                    .longitude(location.getLongitude())
                    .build();

        }).collect(Collectors.toList());
    }

    private List<Accomodation> findAccomodationByUserRequest(AccomodationRequestDto requestDto) {
        return accomodationDao.findByUserRequest(requestDto);
    }

    private List<Image> findImagesByAccomodationId(Long accomodationId) {
        return accomodationDao.findImageByAccomodationId(accomodationId);
    }

    private Location findLocationByLocationId(Long locationId) {
        return accomodationDao.findLocationByLocationId(locationId);
    }

    private String getArea(Location location) {
        return String.join(",", location.getCity(), location.getRegion(), location.getCountry());
    }

    private List<String> parseOptions(String option) {
        return Arrays.asList(option.split(", "));
    }

    public List<Integer> getPricesByLocationRange(LocationRangeDto locationRangeDto) {
        return accomodationDao.findPricesByLocationRange(locationRangeDto);
    }

    public List<Integer> getPricesByTravelRange(TravelRangeDto travelRangeDto) {
        return accomodationDao.findPricesByTravelRange(travelRangeDto);
    }
}
