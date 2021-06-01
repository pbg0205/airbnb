package com.codsquad.airbnb.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

@Getter
@Setter
@Builder
public class Image {
    @Id
    private Long imageId;

    private Long accomodationId;

    private String imageUrl;
}
