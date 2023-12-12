-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cul-ampolla-schema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cul-ampolla-schema` ;

-- -----------------------------------------------------
-- Schema cul-ampolla-schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul-ampolla-schema` DEFAULT CHARACTER SET utf8mb3 ;
USE `cul-ampolla-schema` ;

-- -----------------------------------------------------
-- Table `cul-ampolla-schema`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul-ampolla-schema`.`empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cul-ampolla-schema`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul-ampolla-schema`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `codigopostal` INT NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `fecharegistro` DATE NOT NULL COMMENT 'YYYY-MM-DD',
  `empleados_id` INT NOT NULL,
  PRIMARY KEY (`id`, `empleados_id`),
  CONSTRAINT `fk_cliente_empleados1`
    FOREIGN KEY (`empleados_id`)
    REFERENCES `cul-ampolla-schema`.`empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_cliente_empleados1_idx` ON `cul-ampolla-schema`.`cliente` (`empleados_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cul-ampolla-schema`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul-ampolla-schema`.`proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL COMMENT 'calle, nuúmero, piso, puerta, ciudad, código postal y país',
  `telefono` INT NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cul-ampolla-schema`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul-ampolla-schema`.`gafas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(40) NOT NULL,
  `graduacion` DECIMAL(3,2) NOT NULL COMMENT 'x.yz',
  `montura` VARCHAR(20) NOT NULL COMMENT 'flotante, pasta o metálica',
  `colorMontura` VARCHAR(20) NOT NULL,
  `colorCristal` VARCHAR(20) NOT NULL,
  `precio` INT NOT NULL,
  `proveedor_id` INT NOT NULL,
  `empleados_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `cliente_empleados_id` INT NOT NULL,
  PRIMARY KEY (`id`, `proveedor_id`, `empleados_id`, `cliente_id`, `cliente_empleados_id`),
  CONSTRAINT `fk_gafas_proveedor`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `cul-ampolla-schema`.`proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafas_empleados1`
    FOREIGN KEY (`empleados_id`)
    REFERENCES `cul-ampolla-schema`.`empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafas_cliente1`
    FOREIGN KEY (`cliente_id` , `cliente_empleados_id`)
    REFERENCES `cul-ampolla-schema`.`cliente` (`id` , `empleados_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_gafas_proveedor_idx` ON `cul-ampolla-schema`.`gafas` (`proveedor_id` ASC) VISIBLE;

CREATE INDEX `fk_gafas_empleados1_idx` ON `cul-ampolla-schema`.`gafas` (`empleados_id` ASC) VISIBLE;

CREATE INDEX `fk_gafas_cliente1_idx` ON `cul-ampolla-schema`.`gafas` (`cliente_id` ASC, `cliente_empleados_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cul-ampolla-schema`.`periodos-tiempo-ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul-ampolla-schema`.`periodos-tiempo-ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `horario` VARCHAR(20) NOT NULL,
  `empleados_id` INT NOT NULL,
  PRIMARY KEY (`id`, `empleados_id`),
  CONSTRAINT `fk_periodos-tiempo-ventas_empleados1`
    FOREIGN KEY (`empleados_id`)
    REFERENCES `cul-ampolla-schema`.`empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_periodos-tiempo-ventas_empleados1_idx` ON `cul-ampolla-schema`.`periodos-tiempo-ventas` (`empleados_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
