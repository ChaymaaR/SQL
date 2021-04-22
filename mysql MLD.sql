-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema soto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema soto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soto` DEFAULT CHARACTER SET utf8 ;
USE `soto` ;

-- -----------------------------------------------------
-- Table `soto`.`abonnes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soto`.`abonnes` (
  `idabonnes` INT(10) NOT NULL AUTO_INCREMENT,
  `nom_abonne` TINYTEXT NOT NULL,
  `prenom_abonne` TINYTEXT NOT NULL,
  `adresse_abonne` MEDIUMTEXT NOT NULL,
  `badge` INT(10) NOT NULL,
  `statut_abonnes` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idabonnes`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soto`.`parking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soto`.`parking` (
  `id_parking` INT(10) NOT NULL AUTO_INCREMENT,
  `adresse_parking` TINYTEXT NOT NULL,
  `codepostal_parking` DECIMAL(10,0) NOT NULL,
  `ville_parking` TINYTEXT NOT NULL,
  `capacite_parking` DECIMAL(10,0) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_parking`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soto`.`voitures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soto`.`voitures` (
  `idvoitures` INT(10) NOT NULL AUTO_INCREMENT,
  `immatriculation_voitures` TINYTEXT NOT NULL,
  `marque_voitures` TINYTEXT NOT NULL,
  `modèle_voitures` TINYTEXT NULL DEFAULT NULL,
  `présence_voitures` TINYINT(4) NULL DEFAULT NULL,
  `FKid_abonnes` INT(11) NOT NULL,
  PRIMARY KEY (`idvoitures`),
  CONSTRAINT `FKid_abonnes`
    FOREIGN KEY (`FKid_abonnes`)
    REFERENCES `soto`.`abonnes` (`idabonnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soto`.`enregistre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soto`.`enregistre` (
  `idenregistre` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `début_abonnement` DATETIME NULL DEFAULT NULL,
  `fin_abonnement` DATETIME NULL DEFAULT NULL,
  `entrée` DATETIME NOT NULL,
  `sortie` DATETIME NOT NULL,
  `FKid_parking` INT(11) NOT NULL,
  `FKid_voitures` INT(11) NOT NULL,
  PRIMARY KEY (`idenregistre`),
  CONSTRAINT `FKid_parking`
    FOREIGN KEY (`FKid_parking`)
    REFERENCES `soto`.`parking` (`id_parking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKid_voitures`
    FOREIGN KEY (`FKid_voitures`)
    REFERENCES `soto`.`voitures` (`idvoitures`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
