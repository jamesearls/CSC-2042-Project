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