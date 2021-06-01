package com.codsquad.airbnb.mapper;

import com.codsquad.airbnb.domain.Location;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LocationMapper implements RowMapper<Location> {
    @Override
    public Location mapRow(ResultSet rs, int rowNum) throws SQLException {
        return Location.builder()
                .locationId(rs.getLong("location_id"))
                .locationName(rs.getString("location_name"))
                .city(rs.getString("city"))
                .region(rs.getString("region"))
                .country(rs.getString("country"))
                .latitude(rs.getDouble("latitude"))
                .longitude(rs.getDouble("longitude"))
                .build();
    }
}

