-- Inserts

SET FOREIGN_KEY_CHECKS=0;

-- Building
INSERT IGNORE INTO `building` (`buildingId`, `address_houseNo`, `address_addressLine1`, `address_addressLine2`, `address_city`, `postcode`) values  
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
INSERT IGNORE INTO `apartment` (`apartmentNo`,`buildingId`,`managerId`,`noOfBedrooms`,`noOfBathrooms`,`area`) VALUES
	(1,1,1,2,2,46.74),
	(2,1,2,2,1,33.21),
	(3,1,1,1,1,53.2),
	(1,2,2,2,1,50.1),
	(1,3,1,2,2,76.74),
	(2,2,2,2,1,43.21),
	(2,3,1,1,1,33.2),
	(3,3,1,1,1,47.1);

-- Skill
INSERT IGNORE INTO `skill` (`skillId`,`type`) VALUES 
	(1,'Plumbing'),
	(2,'Carpentry'),
	(3,'Joinery'),
	(4,'Wiring'),
	(5,'Engineering'),
	(6,'Fabricating'),
	(7,'Repairing'),
	(8,'Welding'),
	(9,'Computing'),
	(10,'Gardening'),
	(11,'Managing');
    
-- GuestTenant
INSERT IGNORE INTO guestTenant 
    (guestTenantId, duration, apartmentNo)
    VALUES 
    (1,10,1),
    (2,15,2),
    (3,12,3),
    (4,20,4),
    (5,5,5);

-- Manager
INSERT IGNORE INTO manager
    (managerId, employeeID, apartmentNo, buildingId)
    VALUES
    (1, 10, 1, 1),
    (2, 11, 2, 1),
    (3, 12, 3, 1),
    (4, 13, 4, 2),
    (5, 14, 5, 2);

SET FOREIGN_KEY_CHECKS=1;