package com.codsquad.airbnb.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class LocalDateUtil {

    private LocalDateUtil() {
    }

    public static LocalDate parseToLocalDate(String str) {
        return LocalDate.parse(str, DateTimeFormatter.ISO_DATE);
    }
}
