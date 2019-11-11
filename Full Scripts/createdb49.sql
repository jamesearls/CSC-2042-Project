-- Full Create Script

SET FOREIGN_KEY_CHECKS=0;

CREATE SCHEMA IF NOT EXISTS `csc2042-g49`;
USE `csc2042-g49`;

CREATE TABLE IF NOT EXISTS `building` (
	`buildingId` INT NOT NULL AUTO_INCREMENT,
	`address_houseNo` VARCHAR(50) NOT NULL,
	`address_addressLine1` VARCHAR(255) DEFAULT NULL,
	`address_addressLine2` VARCHAR(255) DEFAULT NULL,
	`address_city` VARCHAR(255) DEFAULT NULL,
	`postcode` VARCHAR(8) DEFAULT NULL,
PRIMARY KEY (`buildingId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `manager` (
    `managerId` INT NOT NULL AUTO_INCREMENT,
    `employeeId` INT NOT NULL,
    `apartmentNo` INT NOT NULL,
    `buildingId` INT NOT NULL,
    PRIMARY KEY (`managerId`),
    CONSTRAINT `fk_manager_employeeId` FOREIGN KEY (`employeeId`) REFERENCES `employee`(`employeeId`),
    CONSTRAINT `fk_manager_apartmentNo` FOREIGN KEY (`apartmentNo`) REFERENCES `apartment`(`apartmentNo`),
    CONSTRAINT `fk_manager_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `apartment`(`buildingId`)
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
	`skillId` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NOT NULL,
PRIMARY KEY (`skillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `employee` (
	`employeeId` INT NOT NULL AUTO_INCREMENT,
	`peopleId` INT NOT NULL,
	`monthlySalary` Decimal (10,2) NOT NULL,
PRIMARY KEY (`employeeId`, `peopleId`),
CONSTRAINT `fk_employee_peopleId` FOREIGN KEY (`peopleId`) REFERENCES `people` (`peopleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tenant` (
`tenantId` INT NOT NULL AUTO_INCREMENT,
`peopleId` INT NOT NULL,
`bankAccountNo` VARCHAR(8) DEFAULT NULL, -- Sort code?
`isActive` BIT(1) DEFAULT b'1',
PRIMARY KEY(`tenantId`),
CONSTRAINT `fk_tenant_peopleId`FOREIGN KEY(`peopleId`) REFERENCES `people`(`peopleId`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE IF NOT EXISTS `leaseTenant`(
`tenantId` INT NOT NULL,
`leaseAgreementId` INT NOT NULL,
PRIMARY KEY (`tenantId`, `leaseAgreementId`),
CONSTRAINT `fk_leasetenant_tenantId` FOREIGN KEY(`tenantId`) REFERENCES `tenant`(`tenantId`),
CONSTRAINT `fk_leaseTenant_leaseAgreementId` FOREIGN KEY(`leaseAgreementId`) references `leaseAgreement`(`leaseAgreementId`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contactInfo` (
  `contactInfoId` INT NOT NULL AUTO_INCREMENT,
  `peopleId` INT NOT NULL,
  `name_firstName` VARCHAR(45) NOT NULL,
  `name_lastName` VARCHAR(45) NOT NULL,
  `teleNumber` INT NOT NULL,
  PRIMARY KEY (`contactInfoId`),
  CONSTRAINT `fk_contactInfo_peopleId` FOREIGN KEY(`peopleId`) REFERENCES `people`(`peopleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `people` (
  `peopleId` INT NOT NULL AUTO_INCREMENT,
  `name_firstName` VARCHAR(45) NOT NULL,
  `name_lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`peopleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `guestTenant` (
  `guestTenantId` INT NOT NULL AUTO_INCREMENT,
  `tenantId` INT NOT NULL,
  `duration` INT NOT NULL,
  `apartmentNo` INT NOT NULL,
  `buildingId` INT NOT NULL,
  PRIMARY KEY (`guestTenantId`),
  CONSTRAINT `fk_guestTenant_apartmentNo` FOREIGN KEY (`apartmentNo`) REFERENCES `apartment` (`apartmentNo`),
  CONSTRAINT `fk_guestTenant_buildingId` FOREIGN KEY (`buildingId`) REFERENCES `apartment` (`buildingId`),
  CONSTRAINT `fk_guestTenant_tenantId` FOREIGN KEY (`tenantId`) REFERENCES `tenant` (`tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=1;