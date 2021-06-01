package com.codsquad.airbnb.mapper;

import com.codsquad.airbnb.domain.Accomodation;
import com.codsquad.airbnb.domain.Location;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AccomodationMapper implements RowMapper<Accomodation> {

    @Override
    public Accomodation mapRow(ResultSet rs, int rowNum) throws SQLException {
        return Accomodation.builder()
                .accomodtionId(rs.getLong("accomodation_id"))
                .accomodationName(rs.getString("accmodation_name"))
                .hostName(rs.getString("host_name"))
                .discription(rs.getString("discription"))
                .accomodationType(rs.getString("accomodation_type"))
                .price(rs.getInt("price"))
                .maximumOccupancy(rs.getInt("maximum_occupancy"))
                .averagePoint(rs.getDouble("average_point"))
                .bedRoom(rs.getInt("bed_room"))
                .bathRoom(rs.getInt("bath_room"))
                .bedCount(rs.getInt("bed_count"))
                .build();
    }
}
