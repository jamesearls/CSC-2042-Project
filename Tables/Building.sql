CREATE TABLE IF NOT EXISTS `building` (
	`buildingId` INT NOT NULL AUTO_INCREMENT,
	`address_houseNo` varchar(50) NOT NULL,
	`address_addressLine1` varchar(255) DEFAULT NULL,
	`address_addressLine2` varchar(255) DEFAULT NULL,
	`address_city` varchar(255) DEFAULT NULL,
	`postcode` varchar(8) DEFAULT NULL,
PRIMARY KEY (`buildingId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;