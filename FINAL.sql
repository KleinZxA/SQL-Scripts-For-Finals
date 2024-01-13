
CREATE SCHEMA IF NOT EXISTS `botdb` DEFAULT CHARACTER SET utf8 ;
USE `botdb` ;

-- -----------------------------------------------------
-- Table `botdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `botdb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `botdb`.`responses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `botdb`.`responses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` INT NOT NULL,
  `response` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `name_fk` (`name` ASC) VISIBLE,
  CONSTRAINT `name_fk`
    FOREIGN KEY (`name`)
    REFERENCES `botdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
