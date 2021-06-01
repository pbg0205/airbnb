--LOCATION
INSERT INTO LOCATION (LOCATION_ID, LOCATION_NAME, COUNTRY, REGION, CITY, LATITUDE, LONGITUDE) VALUES (1, '코드 스쿼드', '한국', '서울시', '강남구', 0, 0);

--ACCOMODATION
INSERT INTO ACCOMODATION (`ACCOMODATION_ID`, `LOCATION_ID`, `ACCOMODATION_NAME`, `HOST_NAME`, `DISCRIPTION`,
                          `ACCOMODATION_TYPE`, `PRICE`, `MAXIMUM_OCCUPANCY`, `AVERAGE_POINT`, `BED_ROOM`, `BATH_ROOM`,
                          `BED_COUNT`,`OPTION`)
VALUES (1, 1,'취향저격 숙소', 'cooper', '설명1', '아파트', 100000, 8, 4.5, 1, 1, 2, '드라이기');

-- INSERT INTO ACCOMODATION (`ACCOMODATION_ID`, `LOCATION_ID`, `ACCOMODATION_NAME`, `HOST_NAME`, `DISCRIPTION`,
--                           `ACCOMODATION_TYPE`, `PRICE`, `MAXIMUM_OCCUPANCY`, `AVERAGE_POINT`, `BED_ROOM`, `BATH_ROOM`,
--                           `BED_COUNT`,`OPTION`)
-- VALUES (2, 2,'취향저격 숙소', 'cooper', '설명1', '아파트',10000, 8, 4.5, 1, 1, 2, '드라이기, 에어컨');
--
-- INSERT INTO ACCOMODATION (`ACCOMODATION_ID`, `LOCATION_ID`, `ACCOMODATION_NAME`, `HOST_NAME`, `DISCRIPTION`,
--                           `ACCOMODATION_TYPE`, `PRICE`, `MAXIMUM_OCCUPANCY`, `AVERAGE_POINT`, `BED_ROOM`, `BATH_ROOM`,
--                           `BED_COUNT`,`OPTION`)
-- VALUES (3, 3,'취향저격 숙소', 'cooper', '설명1', '아파트', 1000, 8, 4.5, 1, 1, 2, '드라이기, 에어컨');
--
-- INSERT INTO ACCOMODATION (`ACCOMODATION_ID`, `LOCATION_ID`, `ACCOMODATION_NAME`, `HOST_NAME`, `DISCRIPTION`,
--                           `ACCOMODATION_TYPE`, `PRICE`, `MAXIMUM_OCCUPANCY`, `AVERAGE_POINT`, `BED_ROOM`, `BATH_ROOM`,
--                           `BED_COUNT`,`OPTION`)
-- VALUES (4, 4,'취향저격 숙소', 'cooper', '설명1', '아파트', 50000, 8, 4.5, 1, 1, 2, '에어컨, 와이파이');

--IMAGE
INSERT INTO IMAGE (IMAGE_ID, ACCOMODATION_ID, IMAGE_URL) VALUES (1, 1, 'https://images.adsttc.com/media/images/5ecd/d4ac/b357/65c6/7300/009d/slideshow/02C.jpg?1590547607');
