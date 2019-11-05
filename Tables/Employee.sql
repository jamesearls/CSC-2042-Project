CREATE TABLE IF NOT EXISTS `employee` (
	`employeeId` INT NOT NULL,
	`peopleId` INT NOT NULL,
	`monthlySalary` Decimal (10,2) NOT NULL,
PRIMARY KEY (`employeeId`, `peopleId`),
CONSTRAINT `fk_employee_peopleId` FOREIGN KEY (`peopleId`) REFERENCES `people` (`peopleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

