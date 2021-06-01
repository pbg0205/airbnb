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
public class Image {
    @Id
    private Long imageId;

    private Long accomodationId;

    private String imageUrl;
}
