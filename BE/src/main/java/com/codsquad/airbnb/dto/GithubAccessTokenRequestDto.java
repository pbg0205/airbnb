package com.codsquad.airbnb.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class GithubAccessTokenRequestDto {

    @JsonProperty("client_id")
    private String clientId;

    @JsonProperty("client_secret")
    private String clientSecret;

    @JsonProperty("code")
    private String code;

    public GithubAccessTokenRequestDto() {
    }

    public GithubAccessTokenRequestDto(String clientId, String clientSecret, String code) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.code = code;
    }

    public String getClientId() {
        return clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public String getCode() {
        return code;
    }
}