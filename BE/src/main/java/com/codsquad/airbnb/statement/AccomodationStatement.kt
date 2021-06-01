package com.codesquad.airbnb.web.statement;

const val SEARCH_ACCOMODATION: String = """
   SELECT 
    A.accomodation_id, A.location_id, A.accomodation_name, A.accomodation_type, A.host_name, A.discription, A.price, 
    A.maximum_occupancy, A.average_point, A.bed_room, A.bath_room, A.bed_count, A.option, 
    L.location_name, L.country, L.region, L.city, L.latitude, L.longitude  
   FROM ACCOMODATION A 
   INNER JOIN LOCATION L ON L.location_id = A.location_id 
   LEFT JOIN RESERVATION R ON A.accomodation_id = R.accomodation_id 
   WHERE A.maximum_occupancy >= :total_people 
   AND L.latitude BETWEEN :sw_lat AND :ne_lat 
   AND L.longitude BETWEEN :sw_lng AND :ne_lng
   AND A.price BETWEEN :price_range_min AND :price_range_max; 
"""
const val FIND_ACCOMODATION: String = """
    SELECT A.accomodation_id, A.accomodation_name, A.accomodation_type, A.host_name, A.discription,
     A.price, A.maximum_occupancy, A.average_point, A.bed_room, A.bath_room, A.bed_count, A.option, 
    L.location_name, L.country, L.region, L.city 
    FROM ACCOMODATION A
    INNER JOIN LOCATION ON L.location_id = A.location_id;
"""
const val FIND_IMAGES: String = """
    SELECT image_id, accomodation_id,image_url 
    FROM IMAGE 
    WHERE accomodation_id = :accomodation_id;
"""

const val FIND_LOCATION: String = """
    SELECT location_id, location_name, country, region, city, latitude, longitude
    FROM LOCATION
    WHERE location_id = :location_id;
"""

const val FIND_PRICES_BY_LOCATION_RANGE: String = """
    SELECT A.price 
    FROM ACCOMODATION A 
    INNER JOiN LOCATION L ON L.location_id = A.location_id 
    WHERE L.latitude BETWEEN :sw_lat AND ne_lat 
    AND L.longitude BETWEEN : sw_lng AND ne_lng;
"""

const val FIND_PRICES_BY_TRAVEL_RANGE: String = """
    SELECT price
    FROM ACCOMODATION
    WHERE price BETWEEN :check_int AND :check_out;
"""
