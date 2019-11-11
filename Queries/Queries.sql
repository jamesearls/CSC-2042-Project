-- Queries
USE `csc2042-g49`;

-- Find a list of technicians that currently live in an apartment
SELECT 
    people.`firstName` as 'First Name',
    people.`lastName` as 'Last Name'
FROM
    people p
        INNER JOIN
    employee e ON p.peopleId = e.peopleId
        INNER JOIN
    tenant t ON p.peopleId = t.peopleId
		INNER JOIN
    leaseTenant lt ON lt.tenantId = t.tenantId
		INNER JOIN
    leaseAgreement la ON la.leaseAgreementId = lt.leaseAgreementId
WHERE
    e.employeeId IN (SELECT DISTINCT
            t.employeeId
        FROM
            technician t)
        AND t.isActive = 1
        AND la.isActive = 1;

-- Create a query to find the number of active tenants in each building and display the results under a column named "Number of Tennants"
SELECT building.address_addressLine1 AS "Building", COUNT(leaseTenant.tenantId) AS "Number of Tenants" 
FROM leaseTenant 
	INNER JOIN leaseAgreement ON leaseTenant.leaseAgreementId = leaseAgreement.leaseAgreementId 
	INNER JOIN building ON leaseAgreement.buildingId = building.buildingId 
WHERE leaseAgreement.isActive = true 
	GROUP BY leaseAgreement.buildingId 
	ORDER BY building.address_addressLine1;
-- First, I have selected the building addresses to show the building that the Tenants are staying in and used the AS key word to
-- make the attribute headings more user friendly. I then joined leaseAgreement to leaseTenant  in order to find Tenants whose 
-- leases are active and building to leaseAgreement in order to retrieve the address of the building. I have also grouped the
-- results by buildingId and ordred them by alphabetical order of the address 


--Getting all of the GuestTenantID, ApartmentNo, BuildingId, TeleNum, FirstName, LastName & Formatting
SELECT guestTenant.guestTenantId AS GuestID, 
       apartment.apartmentNo AS ApartmentNumber, 
       building.buildingId AS BuildingID, 
       contactInfo.teleNumber AS Telephone_Number, 
       contactInfo.name_firstName AS FirstName, 
       contactInfo.lname_astName AS LastName 
FROM guestTenant 
       INNER JOIN apartment ON guestTenant.apartmentNo = apartment.apartmentNo 
       INNER JOIN building ON guestTenant.buildingId = apartment.buildingId 
       LEFT JOIN contactInfo ON guestTenant.guestTenantId = contactInfo.contactInfoId 
ORDER BY guestTenant.guestTenantId ASC;
