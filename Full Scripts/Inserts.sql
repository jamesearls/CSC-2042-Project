-- Inserts

SET FOREIGN_KEY_CHECKS=0;
USE `csc2042-g49`;

-- Building
INSERT IGNORE INTO `building` (`buildingId`, `address_houseNo`, 
	`address_addressLine1`, `address_addressLine2`, `address_city`, `postcode`)
VALUES  
	(1, '4317', 'Stang', '8294 Steensland Circle', 'Tidaholm', '522 24'),
	(2, '4', 'Barby', '9244 Graedel Avenue', 'Briteiros Santa Leocádia', '4805-458'),
	(3, '1373', 'Quincy', '95930 Roxbury Point', 'Shangdundu', null),
	(4, '6', 'Fairview', '4 Logan Road', 'Xiaxindian', null),
	(5, '0', 'Forster', '16 Judy Drive', 'El Hajeb', null),
	(6, '00', 'Ramsey', '78961 Fisk Road', 'Horní Libina', '789 74'),
	(7, '1021', 'Maple', '2138 Sauthoff Junction', 'Maralal', null),
	(8, '1905', 'Barby', '937 Goodland Road', 'Schenectady', '12305'),
	(9, '2321', 'Thompson', '1766 Scoville Junction', 'Bački Petrovac', null),
	(10, '6', 'Valley Edge', '25 Blackbird Court', 'Arma', null);
    
-- Apartment
INSERT IGNORE INTO `apartment` (`apartmentNo`,`buildingId`,
	`managerId`,`noOfBedrooms`,`noOfBathrooms`,`area`)
VALUES
	(1,1,1,2,2,46.74),
	(2,1,2,2,1,33.21),
	(3,1,1,1,1,53.2),
	(1,2,2,2,1,50.1),
	(1,3,1,2,2,76.74),
	(2,2,2,2,1,43.21),
	(2,3,1,1,1,33.2),
	(3,3,1,1,1,47.1);

-- Skill
INSERT IGNORE INTO `skill` (`skillId`,`type`)
VALUES 
	(1,'Electrical'),
	(2,'Carpentry'),
	(3,'Plumbing');
    
-- GuestTenant
INSERT IGNORE INTO `guestTenant` 
    (`guestTenantId`, `duration`, `apartmentNo`, `buildingId`)
VALUES 
    (1,10,1,1),
    (2,15,2,2),
    (3,12,3,3),
    (4,20,4,4),
    (5,5,5,5);

-- Manager
INSERT IGNORE INTO `manager`
	(`managerId`, `employeeID`, `apartmentNo`, `buildingId`)
VALUES
    (1, 10, 1, 1),
    (2, 11, 2, 1),
    (3, 12, 3, 1),
    (4, 13, 4, 2),
    (5, 14, 5, 2);

-- Tenant
INSERT IGNORE INTO `tenant` 
    (`tenantId`, `peopleId`, `bankAccountNo`, `isActive`)
VALUES 
    (1,1,0293846382,1),
    (2,2,0382628618,1),
    (3,3,0309382717,1),
    (4,4,0432432732,0),
    (5,5,0543284739,0);

-- LeaseTenant
INSERT IGNORE INTO `leaseTenant` 
    (`tenantId`, `leaseAgreementId`)
VALUES 
    (1,1),
    (2,1),
    (3,2),
    (4,4),
    (5,5);
    
-- LeaseAgreement
INSERT INTO `leaseAgreement` (`leaseAgreementId`,`managerId`,`startDate`,
	`duration`,`monthlyRent`,`buildingId`,`apartmentNo`,`isActive`)
VALUES
	(1,3,'2001-10-19 00:00:00',6,250,10,3,'1'),
	(2,1,'2001-10-19 00:00:00',12,300,1,1,'1'),
	(3,2,'2001-10-19 00:00:00',3,220,2,2,'1'),
	(4,5,'2001-10-19 00:00:00',6,200,3,1,'1');

-- Technician
INSERT IGNORE INTO `technician`
    (`employeeId`, `skillId`)
VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,2),
    (5,1),
    (6,2),
    (7,1),
    (8,2),
    (9,3),
    (10,2);
    
SET FOREIGN_KEY_CHECKS=1;