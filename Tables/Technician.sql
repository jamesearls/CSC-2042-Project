CREATE TABLE IF NOT EXISTS `technician` (
	`employeeId` INT NOT NULL,
	`skillId` INT NOT NULL,
PRIMARY KEY (`employeeId`, `skillId`),
CONSTRAINT `fk_technician_employeeId` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
CONSTRAINT `fk_technician_skillId` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
