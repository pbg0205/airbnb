package com.codsquad.airbnb.mapper;

import com.codsquad.airbnb.domain.Image;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageMapper implements RowMapper<Image> {

    @Override
    public Image mapRow(ResultSet rs, int rowNum) throws SQLException {
        return Image.builder()
                .imageId(rs.getLong("image_id"))
                .accomodationId(rs.getLong("accomodation_id"))
                .imageUrl(rs.getString("image_url"))
                .build();
    }
}
