-- MySQL Script generated by MySQL Workbench
-- Thu Oct 11 16:57:04 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `prod_num` INT NOT NULL,
  `product_desc` VARCHAR(45) NULL,
  `std_price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`prod_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `cust_id` INT NOT NULL,
  `sales_terr` VARCHAR(45) NULL,
  `warehouse` VARCHAR(45) NULL,
  `cust_name` VARCHAR(45) NULL,
  `cust_addr` TEXT NULL,
  `disc_code` CHAR(2) NULL,
  `credit_lim` DECIMAL(10,2) NULL,
  `delivery_instructions` TEXT NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoice` (
  `invoice_num` INT NOT NULL,
  `cust_id` INT NOT NULL,
  `invoice_date` VARCHAR(45) NULL,
  `invoice_total_quantity` INT NULL,
  `invoice_total_price` DECIMAL(20,2) NULL,
  PRIMARY KEY (`invoice_num`, `cust_id`),
  INDEX `fk_Invoice_Customer_idx` (`cust_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Customer`
    FOREIGN KEY (`cust_id`)
    REFERENCES `mydb`.`Customer` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InvoiceProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InvoiceProduct` (
  `prod_num` INT NOT NULL,
  `invoice_num` INT NOT NULL,
  `quantity` INT NULL,
  `price` DECIMAL(10,2) NULL,
  `disc_price` VARCHAR(45) NULL,
  PRIMARY KEY (`prod_num`, `invoice_num`),
  INDEX `fk_InvoiceProduct_Invoice1_idx` (`invoice_num` ASC) VISIBLE,
  CONSTRAINT `fk_InvoiceProduct_Product1`
    FOREIGN KEY (`prod_num`)
    REFERENCES `mydb`.`Product` (`prod_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InvoiceProduct_Invoice1`
    FOREIGN KEY (`invoice_num`)
    REFERENCES `mydb`.`Invoice` (`invoice_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
