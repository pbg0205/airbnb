-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airbnb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airbnb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airbnb` DEFAULT CHARACTER SET utf8;
USE `airbnb` ;

DROP TABLE IF EXISTS `LOCATION`;
DROP TABLE IF EXISTS `IMAGE`;
DROP TABLE IF EXISTS `ACCOMODATION`;
DROP TABLE IF EXISTS `RESERVATION`;
DROP TABLE IF EXISTS `ACCOMODATION_OPTION`;
DROP TABLE IF EXISTS `WISH_LIST`;

-- -----------------------------------------------------
-- Table `LOCATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LOCATION`
(
    `LOCATION_ID`   INT          NOT NULL AUTO_INCREMENT,
    `LOCATION_NAME` VARCHAR(500) NOT NULL,
    `COUNTRY`       VARCHAR(45)  NULL,
    `REGION`        VARCHAR(45)  NULL,
    `CITY`          VARCHAR(45)  NULL,
    `LATITUDE`      DOUBLE       NOT NULL,
    `LONGITUDE`     DOUBLE       NOT NULL,
    PRIMARY KEY (`LOCATION_ID`)
) DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `IMAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IMAGE`
(
    `IMAGE_ID`        INT           NOT NULL AUTO_INCREMENT,
    `ACCOMODATION_ID` INT           NOT NULL,
    `IMAGE_URL`       VARCHAR(1000) NULL,
    INDEX             `fk_ACCOMODATION_IMAGE_idx` (`ACCOMODATION_ID` ASC),
    PRIMARY KEY (`IMAGE_ID`),
    CONSTRAINT `fk_ACCOMODATION_IMAGE`
        FOREIGN KEY (`ACCOMODATION_ID`)
            REFERENCES `ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `OPTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ACCOMODATION_OPTION`
(
    `OPTION_ID`           INT     NOT NULL AUTO_INCREMENT,
    `BATH_ROOM_COUNT`     INT     NOT NULL,
    `BED_ROOM_COUNT`      INT     NOT NULL,
    `BED_COUNT`           INT     NOT NULL,
    `HAS_ HAIRDRYER`      TINYINT NOT NULL DEFAULT 0,
    `HAS_KITCHEN`         TINYINT NULL     DEFAULT 0,
    `HAS_AIR_CONDITIONER` TINYINT NULL     DEFAULT 0,
    PRIMARY KEY (`OPTION_ID`)
) DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `ACCOMODATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ACCOMODATION`
(
    `ACCOMODATION_ID`   INT           NOT NULL AUTO_INCREMENT,
    `LOCATION_ID`       INT           NOT NULL,
    `HOST_NAME`         VARCHAR(100)  NULL,
    `DISCRIPTION`       VARCHAR(1000) NULL,
    `ACCOMODATION_TYPE` VARCHAR(45)   NULL,
    `FEE`               INT           NULL DEFAULT 0,
    `MAXIMUM_OCCUPANCY` INT           NULL,
    `AVERAGE_POINT`     DECIMAL(2, 1) NULL,
    `OPTION_ID`         INT           NOT NULL,
    PRIMARY KEY (`ACCOMODATION_ID`),
    INDEX               `fk_ACCOMODATION_LOCATION_idx` (`LOCATION_ID` ASC),
    INDEX               `fk_ACCOMODATION_OPTION1_idx` (`OPTION_ID` ASC),
    CONSTRAINT `fk_ACCOMODATION_LOCATION`
        FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATION` (`LOCATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_ACCOMODATION_OPTION`
        FOREIGN KEY (`OPTION_ID`) REFERENCES `ACCOMODATION_OPTION` (`OPTION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RESERVATION`
(
    `RESERVATION_ID`       INT          NOT NULL,
    `ACCOMODATION_ID`      INT          NOT NULL,
    `LOCATION_ID`          INT          NOT NULL,
    `HEAD_COUNT`           INT          NULL DEFAULT 0,
    `CHECK_IN`             DATETIME     NOT NULL,
    `CHECK_OUT`            DATETIME     NOT NULL,
    `USER_ID`              VARCHAR(200) NULL,
    PRIMARY KEY (`RESERVATION_ID`),
--     INDEX                  `fk_RESERVATION_LOCATION2_idx` (`LOCATION_LOCATION_ID` ASC),
--     INDEX                  `fk_RESERVATION_ACCOMODATION1_idx` (`ACCOMODATION_ID` ASC),
    CONSTRAINT `fk_RESERVATION_LOCATION`
        FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATION` (`LOCATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_RESERVATION_ACCOMODATION`
        FOREIGN KEY (`ACCOMODATION_ID`) REFERENCES `ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `WISH_LIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WISH_LIST` (
    `WISH_LIST_ID`    INT          NOT NULL AUTO_INCREMENT,
    `ACCOMODATION_ID` INT          NOT NULL,
    `USER_ID`         VARCHAR(200) NOT NULL,
    INDEX             `fk_WISH_LIST_ACCOMODATION_idx` (`ACCOMODATION_ID` ASC),
    PRIMARY KEY (`WISH_LIST_ID`),
    CONSTRAINT `fk_WISH_LIST_ACCOMODATION`
        FOREIGN KEY (`ACCOMODATION_ID`) REFERENCES `ACCOMODATION` (`ACCOMODATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RESERVATION`
(
    `RESERVATION_ID`       INT          NOT NULL,
    `ACCOMODATION_ID`      INT          NOT NULL,
    `LOCATION_ID`          INT          NOT NULL,
    `FEE`                  INT          NULL DEFAULT 0,
    `HEAD_COUNT`           INT          NULL DEFAULT 0,
    `CHECK_IN`             DATETIME     NOT NULL,
    `CHECK_OUT`            DATETIME     NOT NULL,
    `USER_ID`              VARCHAR(200) NULL,
    PRIMARY KEY (`RESERVATION_ID`),
--     INDEX                  `fk_RESERVATION_LOCATION2_idx` (`LOCATION_LOCATION_ID` ASC),
--     INDEX                  `fk_RESERVATION_ACCOMODATION1_idx` (`ACCOMODATION_ID` ASC),
    CONSTRAINT `fk_RESERVATION_LOCATION`
        FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATION` (`LOCATION_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_RESERVATION_ACCOMODATION`
        FOREIGN KEY (`ACCOMODATION_ID`) REFERENCES `ACCOMODATION` (`ACCOMODATION_ID`)
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
) DEFAULT CHARSET=utf8;

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
