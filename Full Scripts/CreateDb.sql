-- Full Create Script

SET FOREIGN_KEY_CHECKS=0;

CREATE SCHEMA IF NOT EXISTS `csc2042-g49`;
USE `csc2042-g49`;

CREATE TABLE IF NOT EXISTS `building` (
	`buildingId` INT NOT NULL AUTO_INCREMENT,
	`address_houseNo` varchar(50) NOT NULL,
	`address_addressLine1` varchar(255) DEFAULT NULL,
	`address_addressLine2` varchar(255) DEFAULT NULL,
	`address_city` varchar(255) DEFAULT NULL,
	`postcode` varchar(8) DEFAULT NULL,
PRIMARY KEY (`buildingId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `apartment` (
	`apartmentNo` INT NOT NULL,
	`buildingId` INT NOT NULL,
	`managerId` INT NOT NULL,
	`noOfBedrooms` INT DEFAULT 0,
	`noOfBathrooms` INT DEFAULT 0,
	`area` DOUBLE DEFAULT 0,
PRIMARY KEY (`apartmentNo`, `buildingId`),
CONSTRAINT `fk_apartment_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `building` (`buildingId`),
CONSTRAINT `fk_apartment_managerId` FOREIGN KEY (`managerId`) REFERENCES `manager` (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `leaseAgreement` (
	`leaseAgreementId` INT NOT NULL,
	`managerId` INT NOT NULL,
	`startDate` DATETIME DEFAULT NULL,
	`duration` INT DEFAULT 0,
	`monthlyRent` FLOAT DEFAULT 0,
	`buildingId` INT NOT NULL,
	`apartmentNo` INT NOT NULL,
	`isActive` BIT(1) DEFAULT b'1',
PRIMARY KEY (`leaseAgreementId`),
CONSTRAINT `fk_leaseAgreement_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `apartment` (`buildingId`),
CONSTRAINT `fk_leaseAgreement_apartmentNo` FOREIGN KEY (`apartmentNo`) REFERENCES `apartment` (`apartmentNo`),
CONSTRAINT `fk_leaseAgreement_managerId` FOREIGN KEY (`managerId`) REFERENCES `manager` (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `technician` (
	`employeeId` INT NOT NULL,
	`skillId` INT NOT NULL,
PRIMARY KEY (`employeeId`, `skillId`),
CONSTRAINT `fk_technician_employeeId` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
CONSTRAINT `fk_technician_skillId` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `skill` (
	`skillId` INT NOT NULL,
	`type` varchar(50) NOT NULL,
PRIMARY KEY (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `employee` (
	`employeeId` INT NOT NULL,
	`peopleId` INT NOT NULL,
	`monthlySalary` Decimal (10,2) NOT NULL,
PRIMARY KEY (`employeeId`, `peopleId`),
CONSTRAINT `fk_employee_peopleId` FOREIGN KEY (`peopleId`) REFERENCES `people` (`peopleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=1;