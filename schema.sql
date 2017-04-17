-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "billing" -------------------------------
CREATE DATABASE IF NOT EXISTS `billing` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `billing`;
-- ---------------------------------------------------------


-- CREATE TABLE "accesses" ---------------------------------
-- CREATE TABLE "accesses" -------------------------------------
CREATE TABLE `accesses` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "billing_type" -----------------------------
-- CREATE TABLE "billing_type" ---------------------------------
CREATE TABLE `billing_type` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "departments" ------------------------------
-- CREATE TABLE "departments" ----------------------------------
CREATE TABLE `departments` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "detailes" ---------------------------------
-- CREATE TABLE "detailes" -------------------------------------
CREATE TABLE `detailes` ( 
	`id` BigInt( 20 ) AUTO_INCREMENT NOT NULL,
	`phone_id` Int( 255 ) NULL,
	`called_at` DateTime NULL,
	`duration` VarChar( 11 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`recipient` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`zone_vtk` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`zone_ps` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`service` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`price` Float( 12, 0 ) NULL,
	`period` Date NULL,
	`operator_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "employees" --------------------------------
-- CREATE TABLE "employees" ------------------------------------
CREATE TABLE `employees` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`ldap_guid` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`fio` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`manager_id` Int( 255 ) NULL,
	`role_id` Int( 255 ) NULL,
	`email` Int( 255 ) NULL,
	`ldap_sync` TinyInt( 1 ) NULL DEFAULT '0',
	`deparment_id` Int( 255 ) NULL,
	`access_id` Int( 255 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "operators" --------------------------------
-- CREATE TABLE "operators" ------------------------------------
CREATE TABLE `operators` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "phones" -----------------------------------
-- CREATE TABLE "phones" ---------------------------------------
CREATE TABLE `phones` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`phone` VarChar( 12 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`limit` Int( 255 ) NULL,
	`employee_id` Int( 255 ) NULL,
	`description` TinyText CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "roles" ------------------------------------
-- CREATE TABLE "roles" ----------------------------------------
CREATE TABLE `roles` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `unique_id` UNIQUE( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "trips" ------------------------------------
-- CREATE TABLE "trips" ----------------------------------------
CREATE TABLE `trips` ( 
	`id` Int( 255 ) NOT NULL,
	`employee_id` Int( 11 ) NULL,
	`date_start` Date NULL,
	`date_end` Date NULL,
	`destination_place` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`document` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`target` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE TABLE "users" ------------------------------------
-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users` ( 
	`id` Int( 255 ) AUTO_INCREMENT NOT NULL,
	`ldap_sid` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`username` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`is_admin` TinyInt( 4 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "accesses" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "billing_type" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "departments" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "detailes" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "employees" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "operators" --------------------------------
-- ---------------------------------------------------------


-- Dump data of "phones" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "roles" ------------------------------------
-- ---------------------------------------------------------


-- Dump data of "trips" ------------------------------------
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
INSERT INTO `users`(`id`,`ldap_sid`,`username`,`password`,`is_admin`) VALUES ( '1', '', 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '1' );
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_operators_detailes" -------------------
-- CREATE INDEX "lnk_operators_detailes" -----------------------
CREATE INDEX `lnk_operators_detailes` USING BTREE ON `detailes`( `operator_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_phones_detailes" ----------------------
-- CREATE INDEX "lnk_phones_detailes" --------------------------
CREATE INDEX `lnk_phones_detailes` USING BTREE ON `detailes`( `phone_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_accesses_employees" -------------------
-- CREATE INDEX "lnk_accesses_employees" -----------------------
CREATE INDEX `lnk_accesses_employees` USING BTREE ON `employees`( `access_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_departments_employees" ----------------
-- CREATE INDEX "lnk_departments_employees" --------------------
CREATE INDEX `lnk_departments_employees` USING BTREE ON `employees`( `deparment_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_employees_employees" ------------------
-- CREATE INDEX "lnk_employees_employees" ----------------------
CREATE INDEX `lnk_employees_employees` USING BTREE ON `employees`( `manager_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_roles_employees" ----------------------
-- CREATE INDEX "lnk_roles_employees" --------------------------
CREATE INDEX `lnk_roles_employees` USING BTREE ON `employees`( `role_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_employees_phones" ---------------------
-- CREATE INDEX "lnk_employees_phones" -------------------------
CREATE INDEX `lnk_employees_phones` USING BTREE ON `phones`( `employee_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "lnk_trips_employees" ----------------------
-- CREATE INDEX "lnk_trips_employees" --------------------------
CREATE INDEX `lnk_trips_employees` USING BTREE ON `trips`( `employee_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_operators_detailes" --------------------
-- CREATE LINK "lnk_operators_detailes" ------------------------
ALTER TABLE `detailes`
	ADD CONSTRAINT `lnk_operators_detailes` FOREIGN KEY ( `operator_id` )
	REFERENCES `operators`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_phones_detailes" -----------------------
-- CREATE LINK "lnk_phones_detailes" ---------------------------
ALTER TABLE `detailes`
	ADD CONSTRAINT `lnk_phones_detailes` FOREIGN KEY ( `phone_id` )
	REFERENCES `phones`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "FK_h67yqp5tw66hj7tganejqv7ar" --------------
-- CREATE LINK "FK_h67yqp5tw66hj7tganejqv7ar" ------------------
ALTER TABLE `employees`
	ADD CONSTRAINT `FK_h67yqp5tw66hj7tganejqv7ar` FOREIGN KEY ( `id` )
	REFERENCES `trips`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_accesses_employees" --------------------
-- CREATE LINK "lnk_accesses_employees" ------------------------
ALTER TABLE `employees`
	ADD CONSTRAINT `lnk_accesses_employees` FOREIGN KEY ( `access_id` )
	REFERENCES `accesses`( `id` )
	ON DELETE No Action
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_departments_employees" -----------------
-- CREATE LINK "lnk_departments_employees" ---------------------
ALTER TABLE `employees`
	ADD CONSTRAINT `lnk_departments_employees` FOREIGN KEY ( `deparment_id` )
	REFERENCES `departments`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_employees_employees" -------------------
-- CREATE LINK "lnk_employees_employees" -----------------------
ALTER TABLE `employees`
	ADD CONSTRAINT `lnk_employees_employees` FOREIGN KEY ( `manager_id` )
	REFERENCES `employees`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_employees_trips" -----------------------
-- CREATE LINK "lnk_employees_trips" ---------------------------
ALTER TABLE `employees`
	ADD CONSTRAINT `lnk_employees_trips` FOREIGN KEY ( `id` )
	REFERENCES `trips`( `employee_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_roles_employees" -----------------------
-- CREATE LINK "lnk_roles_employees" ---------------------------
ALTER TABLE `employees`
	ADD CONSTRAINT `lnk_roles_employees` FOREIGN KEY ( `role_id` )
	REFERENCES `roles`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "lnk_employees_phones" ----------------------
-- CREATE LINK "lnk_employees_phones" --------------------------
ALTER TABLE `phones`
	ADD CONSTRAINT `lnk_employees_phones` FOREIGN KEY ( `employee_id` )
	REFERENCES `employees`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


