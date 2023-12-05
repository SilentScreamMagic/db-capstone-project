-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`person` (
  `personId` INT NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`personId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customer` (
  `customerId` INT NOT NULL,
  `contact` VARCHAR(10) NOT NULL,
  `personId` INT NOT NULL,
  PRIMARY KEY (`customerId`),
  INDEX `cust_per_fk_idx` (`personId` ASC) VISIBLE,
  CONSTRAINT `cust_per_fk`
    FOREIGN KEY (`personId`)
    REFERENCES `LittleLemonDB`.`person` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `bookingId` INT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `tableNumber` INT NOT NULL,
  `customerId` INT NOT NULL,
  PRIMARY KEY (`bookingId`),
  INDEX `book_cust_id_idx` (`customerId` ASC) VISIBLE,
  CONSTRAINT `book_cust_id`
    FOREIGN KEY (`customerId`)
    REFERENCES `LittleLemonDB`.`customer` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menuItems` (
  `itemId` INT NOT NULL,
  `itemName` VARCHAR(255) NOT NULL,
  `itemType` VARCHAR(255) NOT NULL,
  `itemPrice` FLOAT NOT NULL,
  PRIMARY KEY (`itemId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menuId` INT NOT NULL,
  `itemId` INT NOT NULL,
  `cuisine` VARCHAR(255) NOT NULL,
  `menuName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`menuId`, `itemId`),
  INDEX `menu_items_fk_idx` (`itemId` ASC) VISIBLE,
  CONSTRAINT `menu_items_fk`
    FOREIGN KEY (`itemId`)
    REFERENCES `LittleLemonDB`.`menuItems` (`itemId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderId` INT NOT NULL,
  `bookingid` INT NOT NULL,
  `orderdate` DATE NOT NULL,
  `menuid` INT NOT NULL,
  `quantity` VARCHAR(45) NOT NULL,
  `totalcost` FLOAT NOT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `order_book_fk_idx` (`bookingid` ASC) VISIBLE,
  INDEX `order_menu_fk_idx` (`menuid` ASC) VISIBLE,
  CONSTRAINT `order_book_fk`
    FOREIGN KEY (`bookingid`)
    REFERENCES `LittleLemonDB`.`Bookings` (`bookingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_menu_fk`
    FOREIGN KEY (`menuid`)
    REFERENCES `LittleLemonDB`.`Menu` (`menuId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryStatus` (
  `DevId` INT NOT NULL,
  `orderId` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DevId`),
  INDEX `dev_orders_fk_idx` (`orderId` ASC) VISIBLE,
  CONSTRAINT `dev_orders_fk`
    FOREIGN KEY (`orderId`)
    REFERENCES `LittleLemonDB`.`Orders` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`employees` (
  `employeeId` INT NOT NULL,
  `employeeRole` VARCHAR(255) NOT NULL,
  `employeesSalary` FLOAT NOT NULL,
  `personId` INT NOT NULL,
  PRIMARY KEY (`employeeId`),
  INDEX `emp_per_fk_idx` (`personId` ASC) VISIBLE,
  CONSTRAINT `emp_per_fk`
    FOREIGN KEY (`personId`)
    REFERENCES `LittleLemonDB`.`person` (`personId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
