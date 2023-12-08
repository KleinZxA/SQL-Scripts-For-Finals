-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema studGrade
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject_code` VARCHAR(45) NOT NULL,
  `subject_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `contact` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `dept_id` INT NOT NULL,
  `user_type` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `dept_idFK_idx` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `user_typeFK`
    FOREIGN KEY (`user_type`)
    REFERENCES `mydb`.`user_type` (`user_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dept_idFK`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mydb`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject_handled_by`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject_handled_by` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  `sched_time_date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `subj_idFK_idx` (`subject_id` ASC) VISIBLE,
  INDEX `usr_idFK_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `subj_idFK`
    FOREIGN KEY (`subject_id`)
    REFERENCES `mydb`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usr_idFK`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grade_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grade_category` (
  `grade_category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`grade_category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grade` (
  `gradeID` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `grade_category` INT NOT NULL,
  `subject_handle_id` INT NOT NULL,
  PRIMARY KEY (`gradeID`),
  INDEX `gradeFK_idx` (`student_id` ASC, `grade_category` ASC, `subject_handle_id` ASC) VISIBLE,
  INDEX `gradeCategoryFK_idx` (`grade_category` ASC) VISIBLE,
  CONSTRAINT `gradeFK`
    FOREIGN KEY (`student_id` , `grade_category` , `subject_handle_id`)
    REFERENCES `mydb`.`subject_handled_by` (`id` , `id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gradeCategoryFK`
    FOREIGN KEY (`grade_category`)
    REFERENCES `mydb`.`grade_category` (`grade_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stud_idFK`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
