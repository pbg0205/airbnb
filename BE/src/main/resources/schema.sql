-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Drop table
-- -----------------------------------------------------
DROP SCHEMA  `airbnb`;

CREATE SCHEMA IF NOT EXISTS `airbnb` DEFAULT CHARACTER SET utf8;
USE `airbnb` ;

DROP TABLE IF EXISTS `LOCATION`;
DROP TABLE IF EXISTS `IMAGE`;
DROP TABLE IF EXISTS `ACCOMODATION`;
DROP TABLE IF EXISTS `RESERVATION`;
DROP TABLE IF EXISTS `ACCOMODATION_OPTION`;
DROP TABLE IF EXISTS `WISH_LIST`;

-- -----------------------------------------------------
-- Table `airbnb`.`LOCATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`LOCATION`
(
    `LOCATION_ID`   INT          NOT NULL AUTO_INCREMENT,
    `LOCATION_NAME` VARCHAR(500) NOT NULL,
    `COUNTRY`       VARCHAR(45)  NULL,
    `REGION`        VARCHAR(45)  NULL,
    `CITY`          VARCHAR(45)  NULL,
    `LATITUDE`      DOUBLE       NOT NULL,
    `LONGITUDE`     DOUBLE       NOT NULL,
    PRIMARY KEY (`LOCATION_ID`)
)
    DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `airbnb`.`ACCOMODATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`ACCOMODATION`
(
    `ACCOMODATION_ID`   INT           NOT NULL AUTO_INCREMENT,
    `LOCATION_ID`       INT           NOT NULL,
    `ACCOMODATION_NAME` VARCHAR(300)  NULL,
    `HOST_NAME`         VARCHAR(100)  NULL,
    `DISCRIPTION`       VARCHAR(1000) NULL,
    `ACCOMODATION_TYPE` VARCHAR(45)   NULL,
    `PRICE`             INT           NULL DEFAULT 0,
    `MAXIMUM_OCCUPANCY` INT           NULL DEFAULT 0,
    `AVERAGE_POINT`     DECIMAL(2, 1) NULL,
    `BED_ROOM`          INT           NULL,
    `BATH_ROOM`         INT           NULL,
    `BED_COUNT`         INT           NULL,
    `OPTION`            VARCHAR(200)  NULL,
    PRIMARY KEY (`ACCOMODATION_ID`),
    INDEX               `fk_ACCOMODATION_LOCATION_idx` (`LOCATION_ID` ASC),
    CONSTRAINT `fk_ACCOMODATION_LOCATION`
        FOREIGN KEY (`LOCATION_ID`)
            REFERENCES `airbnb`.`LOCATION` (`LOCATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `airbnb`.`RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`RESERVATION`
(
    `RESERVATION_ID`  INT          NOT NULL,
    `ACCOMODATION_ID` INT          NOT NULL,
    `TOTAL_PRICE`     INT          NULL DEFAULT 0,
    `HEAD_COUNT`      INT          NULL DEFAULT 0,
    `CHECK_IN`        DATETIME     NOT NULL,
    `CHECK_OUT`       DATETIME     NOT NULL,
    `USER_ID`         VARCHAR(200) NULL,
    PRIMARY KEY (`RESERVATION_ID`),
    INDEX             `fk_RESERVATION_ACCOMODATION1_idx` (`ACCOMODATION_ID` ASC),
    CONSTRAINT `fk_RESERVATION_ACCOMODATION1`
        FOREIGN KEY (`ACCOMODATION_ID`)
            REFERENCES `airbnb`.`ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `airbnb`.`IMAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`IMAGE`
(
    `IMAGE_ID`        INT           NOT NULL AUTO_INCREMENT,
    `ACCOMODATION_ID` INT           NOT NULL,
    `IMAGE_URL`       VARCHAR(1000) NULL,
    INDEX             `fk_ACCOMODATION_IMAGE_ACCOMODATION1_idx` (`ACCOMODATION_ID` ASC),
    PRIMARY KEY (`IMAGE_ID`),
    CONSTRAINT `fk_ACCOMODATION_IMAGE_ACCOMODATION1`
        FOREIGN KEY (`ACCOMODATION_ID`)
            REFERENCES `airbnb`.`ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `airbnb`.`WISH_LIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`WISH`
(
    `WISH_ID`    INT          NOT NULL AUTO_INCREMENT,
    `ACCOMODATION_ID` INT          NOT NULL,
    `USER_ID`         VARCHAR(200) NOT NULL,
    INDEX             `fk_WISH_LIST_ACCOMODATION1_idx` (`ACCOMODATION_ID` ASC),
    PRIMARY KEY (`WISH_ID`),
    CONSTRAINT `fk_WISH_ACCOMODATION1`
        FOREIGN KEY (`ACCOMODATION_ID`)
            REFERENCES `airbnb`.`ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `airbnb`.`RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`RESERVATION`
(
    `RESERVATION_ID`  INT          NOT NULL,
    `ACCOMODATION_ID` INT          NOT NULL,
    `TOTAL_PRICE`     INT          NULL DEFAULT 0,
    `HEAD_COUNT`      INT          NULL DEFAULT 0,
    `CHECK_IN`        DATETIME     NOT NULL,
    `CHECK_OUT`       DATETIME     NOT NULL,
    `USER_ID`         VARCHAR(200) NULL,
    PRIMARY KEY (`RESERVATION_ID`),
    INDEX             `fk_RESERVATION_ACCOMODATION1_idx` (`ACCOMODATION_ID` ASC),
    CONSTRAINT `fk_RESERVATION_ACCOMODATION1`
        FOREIGN KEY (`ACCOMODATION_ID`)
            REFERENCES `airbnb`.`ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    DEFAULT CHARSET=utf8;
