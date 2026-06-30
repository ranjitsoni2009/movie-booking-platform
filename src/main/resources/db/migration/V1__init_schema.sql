-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_mvp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_mvp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_mvp` DEFAULT CHARACTER SET utf8 ;
USE `db_mvp` ;

-- -----------------------------------------------------
-- Table `db_mvp`.`Users`
-- -----------------------------------------------------
CREATE TABLE `Users` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `mobile` VARCHAR(15) NULL,
  `city` VARCHAR(45) NULL,
  `pincode` VARCHAR(6) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `mobile_UNIQUE` (`mobile` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Cities`
-- -----------------------------------------------------
CREATE TABLE `Cities` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `pincode` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `pincode_UNIQUE` (`pincode` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Theatres`
-- -----------------------------------------------------
CREATE TABLE `Theatres` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(100) NULL,
  `company` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Screens`
-- -----------------------------------------------------
CREATE TABLE `Screens` (
  `id` INT NOT NULL,
  `screenName` VARCHAR(45) NULL,
  `theatreId` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_theatreId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Theatres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Movies`
-- -----------------------------------------------------
CREATE TABLE `Movies` (
  `id` INT NOT NULL,
  `movieName` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `producer` VARCHAR(45) NULL,
  `leadActor` VARCHAR(45) NULL,
  `leadActress` VARCHAR(45) NULL,
  `releaseDate` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Features`
-- -----------------------------------------------------
CREATE TABLE `Features` (
  `id` INT NOT NULL,
  `feature` VARCHAR(20) NULL,
  `featureType` VARCHAR(15) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `feature_UNIQUE` (`feature` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`SeatType`
-- -----------------------------------------------------
CREATE TABLE `SeatType` (
  `id` INT NOT NULL,
  `seatType` VARCHAR(15) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Seats`
-- -----------------------------------------------------
CREATE TABLE `Seats` (
  `id` INT NOT NULL,
  `seatName` VARCHAR(4) NULL,
  `seatType` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_seattype_seattypeid`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`SeatType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE `Bookings` (
  `id` INT NOT NULL,
  `bookedBy` INT NULL,
  `bookingDate` DATETIME NULL,
  `bookingStatus` VARCHAR(10) NULL,
  `numOfseats` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_userbooking_bookingId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Payments`
-- -----------------------------------------------------
CREATE TABLE `Payments` (
  `id` INT NOT NULL,
  `bookingId` INT NULL,
  `paymentAmount` DOUBLE NULL,
  `transactionId` VARCHAR(45) NULL,
  `transactionDate` DATETIME NULL,
  `status` VARCHAR(10) NULL,
  `paymentMode` VARCHAR(10) NULL,
  `vendor` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_paymentbooking_bookingId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Bookings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`ScreenFeatures_Mapping`
-- -----------------------------------------------------
CREATE TABLE `ScreenFeatures_Mapping` (
  `id` INT NOT NULL,
  `screenId` INT NULL,
  `featureId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `featureId_idx` (`featureId` ASC) VISIBLE,
  CONSTRAINT `fk_screenfeature_screenId`
    FOREIGN KEY (`screenId`)
    REFERENCES `db_mvp`.`Screens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_screenfeature_featureId`
    FOREIGN KEY (`featureId`)
    REFERENCES `db_mvp`.`Features` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`ScreenSeats_Mapping`
-- -----------------------------------------------------
CREATE TABLE `ScreenSeats_Mapping` (
  `id` INT NOT NULL,
  `screenId` INT NULL,
  `seatId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `screenId_idx` (`screenId` ASC) VISIBLE,
  INDEX `seatId_idx` (`seatId` ASC) VISIBLE,
  CONSTRAINT `fk_screen_seat_mapping_screen`
    FOREIGN KEY (`screenId`)
    REFERENCES `db_mvp`.`Screens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_screen_seat_mapping_seat`
    FOREIGN KEY (`seatId`)
    REFERENCES `db_mvp`.`Seats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `db_mvp`.`Shows`
-- -----------------------------------------------------
CREATE TABLE `Shows` (
  `id` INT NOT NULL,
  `startTime` DATETIME NULL,
  `endTime` DATETIME NULL,
  `showLength` VARCHAR(45) NULL,
  `showStatus` INT NULL,
  `movieId` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_movieshow_movieId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`ShowScreenSeats_Mapping`
-- -----------------------------------------------------
CREATE TABLE `ShowScreenSeats_Mapping` (
  `id` INT NOT NULL,
  `showId` INT NULL,
  `screenSeatsId` INT NULL,
  `status` VARCHAR(10) NULL,
  `bookingId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `showId_idx` (`showId` ASC) VISIBLE,
  INDEX `screenSeatId_idx` (`screenSeatsId` ASC) VISIBLE,
  INDEX `bookingId_idx` (`bookingId` ASC) VISIBLE,
  CONSTRAINT `fk_ShowScreenSeatMapping_showId`
    FOREIGN KEY (`showId`)
    REFERENCES `db_mvp`.`Shows` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ShowScreenSeatMapping_screenSeatId`
    FOREIGN KEY (`screenSeatsId`)
    REFERENCES `db_mvp`.`ScreenSeats_Mapping` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ShowScreenSeatMapping_bookingId`
    FOREIGN KEY (`bookingId`)
    REFERENCES `db_mvp`.`Bookings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`MovieFeatures_Mapping`
-- -----------------------------------------------------
CREATE TABLE `MovieFeatures_Mapping` (
  `id` INT NOT NULL,
  `movieId` INT NULL,
  `featureId` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_moviefeature_movieId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_moviefeature_featureId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Features` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`CityTheatres_Mapping`
-- -----------------------------------------------------
CREATE TABLE `CityTheatres_Mapping` (
  `id` INT NOT NULL,
  `cityId` INT NULL,
  `theatreId` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_citytheatre_mapping_cityId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citytheatre_mapping_theatreId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Theatres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`ShowTicketPrices`
-- -----------------------------------------------------
CREATE TABLE `ShowTicketPrices` (
  `id` INT NOT NULL,
  `showId` INT NULL,
  `seatTypeId` INT NULL,
  `ticketPrice` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_show_showId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Shows` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_showticketpricessseattype_seattypeid`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`SeatType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Genres`
-- -----------------------------------------------------
CREATE TABLE `Genres` (
  `id` INT NOT NULL,
  `genreName` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Casts`
-- -----------------------------------------------------
CREATE TABLE `Casts` (
  `id` INT NOT NULL,
  `actorName` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `bio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Ratings`
-- -----------------------------------------------------
CREATE TABLE `Ratings` (
  `id` INT NOT NULL,
  `movieId` INT NULL,
  `userId` INT NULL,
  `ratingValue` VARCHAR(45) NULL,
  `review` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_movierating_movieId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userrating_userId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`MovieCasts_Mapping`
-- -----------------------------------------------------
CREATE TABLE `MovieCasts_Mapping` (
  `int` INT NOT NULL,
  `movieId` INT NULL,
  `castId` INT NULL,
  PRIMARY KEY (`int`),
  CONSTRAINT `fk_moviecast_movieId`
    FOREIGN KEY (`int`)
    REFERENCES `db_mvp`.`Movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_moviecast_castId`
    FOREIGN KEY (`int`)
    REFERENCES `db_mvp`.`Casts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`MovieGenres_Mapping`
-- -----------------------------------------------------
CREATE TABLE `MovieGenres_Mapping` (
  `id` INT NOT NULL,
  `movieId` INT NULL,
  `genreId` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_moviegnre_movieId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_moviegenre_genreId`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_mvp`.`Notifications`
-- -----------------------------------------------------
CREATE TABLE `Notifications` (
  `id` INT NOT NULL,
  `userId` INT NULL,
  `bookingId` INT NULL,
  `status` VARCHAR(15) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_notificationusers_userid`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notificationusers_bookingid`
    FOREIGN KEY (`id`)
    REFERENCES `db_mvp`.`Bookings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
