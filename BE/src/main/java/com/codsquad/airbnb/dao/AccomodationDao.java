package com.codsquad.airbnb.dao;

import com.codsquad.airbnb.domain.Accomodation;
import com.codsquad.airbnb.domain.Image;
import com.codsquad.airbnb.domain.Location;
import com.codsquad.airbnb.dto.AccomodationRequestDto;
import com.codsquad.airbnb.dto.LocationRangeDto;
import com.codsquad.airbnb.dto.TravelRangeDto;
import com.codsquad.airbnb.mapper.AccomodationMapper;
import com.codsquad.airbnb.mapper.ImageMapper;
import com.codsquad.airbnb.mapper.LocationMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

import static com.codesquad.airbnb.web.statement.AccomodationStatementKt.*;

@Repository
public class AccomodationDao {

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    private AccomodationMapper accomodationMapper = new AccomodationMapper();
    private ImageMapper imageMapper = new ImageMapper();
    private LocationMapper locationMapper = new LocationMapper();

    public AccomodationDao(DataSource dataSource) {
        namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    public List<Accomodation> findByUserRequest(AccomodationRequestDto requestDto) {
        MapSqlParameterSource parameter = new MapSqlParameterSource();

        parameter.addValue("check_in", requestDto.getCheckInDate())
                .addValue("check_out", requestDto.getCheckOutDate())
                .addValue("total_people", requestDto.getTotalMemberCount())
                .addValue("price_range_min", requestDto.getPriceRangeMin())
                .addValue("price_range_max", requestDto.getPriceRangeMax())
                .addValue("sw_lat", requestDto.getSouthWestLatitude())
                .addValue("ne_lat", requestDto.getNorthEastLatitude())
                .addValue("sw_lng", requestDto.getSouthWestLongitude())
                .addValue("ne_lng", requestDto.getNorthEastLongitude());

        return namedParameterJdbcTemplate.query(SEARCH_ACCOMODATION, parameter, accomodationMapper);
    }

    public List<Image> findImageByAccomodationId(Long accomodationId) {
        MapSqlParameterSource parameter = new MapSqlParameterSource();
        parameter.addValue("accomodation_id", accomodationId);
        return namedParameterJdbcTemplate.query(FIND_IMAGES, parameter, imageMapper);
    }

    public Location findLocationByAccomodationId(Long accomodationId) {
        MapSqlParameterSource parameter = new MapSqlParameterSource();
        parameter.addValue("accomodation_id", accomodationId);
        return namedParameterJdbcTemplate.queryForObject(FIND_LOCATION, parameter, locationMapper);
    }

    public List<Integer> findPricesByLocationRange(LocationRangeDto locationRangeDto) {
        MapSqlParameterSource parameter = new MapSqlParameterSource();

        parameter.addValue("sw_lat", locationRangeDto.getSouthWestLatitude())
                .addValue("sw_lng", locationRangeDto.getSouthWestlongitude())
                .addValue("ne_lat", locationRangeDto.getNorthEastLatitude())
                .addValue("ne_lng", locationRangeDto.getNorthEastLongitude());

        return namedParameterJdbcTemplate.queryForList(FIND_PRICES_BY_LOCATION_RANGE, parameter, Integer.class);
    }

    public List<Integer> findPricesByTravelRange(TravelRangeDto travelRangeDto) {
        MapSqlParameterSource parameter = new MapSqlParameterSource();

        parameter.addValue("check_in", travelRangeDto.getCheckInDate())
                .addValue("check_out", travelRangeDto.getCheckOutDate());

        return namedParameterJdbcTemplate.queryForList(FIND_PRICES_BY_TRAVEL_RANGE, parameter, Integer.class);
    }
}
