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