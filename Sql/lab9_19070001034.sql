-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `telNumber` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `birthDate` DATE NULL,
  `address` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Review` (
  `id` INT NOT NULL,
  `comment` VARCHAR(200) NULL,
  `Restaurant_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Review_Restaurant1_idx` (`Restaurant_id` ASC) VISIBLE,
  INDEX `fk_Review_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `mydb`.`Restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `mydb`.`Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurant` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `telNumber` VARCHAR(15) NOT NULL,
  `openTime` TIME NOT NULL,
  `closeTime` TIME NOT NULL,
  `avgDeliveryTime` VARCHAR(20) NOT NULL,
  `rate` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `rate_idx` (`rate` ASC, `id` ASC) VISIBLE,
  CONSTRAINT `rate`
    FOREIGN KEY (`rate` , `id`)
    REFERENCES `mydb`.`Review` (`id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Food` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NULL,
  `price` DOUBLE NOT NULL,
  `image` BINARY NULL,
  `Restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Menu_Restaurant1_idx` (`Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `mydb`.`Restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `Restaurant_id` INT NOT NULL,
  `dateAndTime` DATETIME NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Order_Restaurant1_idx` (`Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Restaurant1`
    FOREIGN KEY (`Restaurant_id`)
    REFERENCES `mydb`.`Restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `streetName` VARCHAR(60) NOT NULL,
  `neighbourhood` VARCHAR(60) NOT NULL,
  `town` VARCHAR(45) NOT NULL,
  `building` INT NOT NULL,
  `residenceNumber` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `id` INT NOT NULL,
  `method` VARCHAR(45) NOT NULL,
  `creditCardNo` VARCHAR(20) NOT NULL,
  `validThru` DATE NOT NULL,
  `cvv` INT NOT NULL,
  `owner` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer_has_Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer_has_Address` (
  `Customer_id` INT NOT NULL,
  `Address_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_id`, `Address_id`),
  INDEX `fk_Customer_has_Address_Address1_idx` (`Address_id` ASC) VISIBLE,
  INDEX `fk_Customer_has_Address_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_has_Address_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `mydb`.`Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Address_Address1`
    FOREIGN KEY (`Address_id`)
    REFERENCES `mydb`.`Address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_has_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order_has_Customer` (
  `Order_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Order_id`, `Customer_id`),
  INDEX `fk_Order_has_Customer_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Order_has_Customer_Order1_idx` (`Order_id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_Customer_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `mydb`.`Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Customer_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `mydb`.`Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment_has_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment_has_Customer` (
  `Payment_id` INT NOT NULL,
  `Customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`Payment_id`, `Customer_id`),
  INDEX `fk_Payment_has_Customer_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Payment_has_Customer_Payment1_idx` (`Payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_Payment_has_Customer_Payment1`
    FOREIGN KEY (`Payment_id`)
    REFERENCES `mydb`.`Payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_has_Customer_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `mydb`.`Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;








SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
