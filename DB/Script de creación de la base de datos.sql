-- MySQL Script generated by MySQL Workbench
-- Sat Sep 16 03:52:01 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lcpDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lcpDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lcpDB` DEFAULT CHARACTER SET utf8 ;
USE `lcpDB` ;

-- -----------------------------------------------------
-- Table `lcpDB`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lcpDB`.`roles` (
  `role_id` BIGINT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lcpDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lcpDB`.`users` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `lastname2` VARCHAR(100) NULL,
  `birthdate` DATE NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `phonenumber` VARCHAR(15) NOT NULL,
  `sex` VARCHAR(10) NOT NULL,
  `fk_role_id` BIGINT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_id_role_idx` (`fk_role_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_id`
    FOREIGN KEY (`fk_role_id`)
    REFERENCES `lcpDB`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lcpDB`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lcpDB`.`categories` (
  `category_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `url` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lcpDB`.`studies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lcpDB`.`studies` (
  `study_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1500) NOT NULL,
  `indications` VARCHAR(1000) NOT NULL,
  `wait_time` VARCHAR(50) NOT NULL,
  `fk_category_id` BIGINT NOT NULL,
  `url` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`study_id`),
  INDEX `fk_id_category_idx` (`fk_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_id`
    FOREIGN KEY (`fk_category_id`)
    REFERENCES `lcpDB`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lcpDB`.`appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lcpDB`.`appointments` (
  `appointment_id` BIGINT NOT NULL AUTO_INCREMENT,
  `datetime` DATETIME NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `lastname2` VARCHAR(100) NULL,
  `phonenumber` VARCHAR(15) NOT NULL,
  `birthdate` DATE NOT NULL,
  `sex` VARCHAR(10) NOT NULL,
  `fk_user_id` BIGINT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `fk_id_user_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `lcpDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lcpDB`.`appointments_has_studies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lcpDB`.`appointments_has_studies` (
  `appointments_id` BIGINT NOT NULL,
  `studies_id` BIGINT NOT NULL,
  PRIMARY KEY (`appointments_id`, `studies_id`),
  INDEX `fk_studies_has_appointments_appointments1_idx` (`appointments_id` ASC) VISIBLE,
  INDEX `fk_studies_has_appointments_studies1_idx` (`studies_id` ASC) VISIBLE,
  CONSTRAINT `fk_studies_has_appointments_studies1`
    FOREIGN KEY (`studies_id`)
    REFERENCES `lcpDB`.`studies` (`study_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_studies_has_appointments_appointments1`
    FOREIGN KEY (`appointments_id`)
    REFERENCES `lcpDB`.`appointments` (`appointment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
