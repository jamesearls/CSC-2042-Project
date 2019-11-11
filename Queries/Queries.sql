-- Queries
USE `csc2042-g49`;

-- Find a list of technicians that currently live in an apartment
SELECT 
    e.`employeeId` AS 'Employee ID',
    p.`name_firstName` AS 'First Name',
    p.`name_lastName` AS 'Last Name',
    (e.`monthlySalary` - (la.`monthlyRent` / (SELECT 
            COUNT(`tenantId`)
        FROM
            leaseTenant
        WHERE
            `leaseAgreementId` = la.`leaseAgreementId`))) AS 'Salary After Rent'
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
        AND la.isActive = 1
ORDER BY p.peopleId ASC;

-- Create a query to find the number of active tenants in each building and display the results under a column named "Number of Tennants"
SELECT 
    building.address_addressLine1 AS 'Building',
    COUNT(leaseTenant.tenantId) AS 'Number of Tenants'
FROM
    leaseTenant
        INNER JOIN
    leaseAgreement ON leaseTenant.leaseAgreementId = leaseAgreement.leaseAgreementId
        INNER JOIN
    building ON leaseAgreement.buildingId = building.buildingId
WHERE
    leaseAgreement.isActive = TRUE
GROUP BY leaseAgreement.buildingId
ORDER BY building.address_addressLine1;
-- First, I have selected the building addresses to show the building that the Tenants are staying in and used the AS key word to
-- make the attribute headings more user friendly. I then joined leaseAgreement to leaseTenant  in order to find Tenants whose 
-- leases are active and building to leaseAgreement in order to retrieve the address of the building. I have also grouped the
-- results by buildingId and ordred them by alphabetical order of the address 

-- Getting all of the GuestTenantID, ApartmentNo, BuildingId, TeleNum, FirstName, LastName & Formatting
SELECT guestTenant.guestTenantId AS GuestID, 
    apartment.apartmentNo AS ApartmentNumber, 
    apartment.buildingId AS BuildingID, 
    contactInfo.teleNumber AS Telephone_Number, 
    contactInfo.name_firstName AS FirstName, 
    contactInfo.name_lastName AS LastName 
FROM guestTenant 
    INNER JOIN apartment ON guestTenant.apartmentNo = apartment.apartmentNo AND guestTenant.buildingId = apartment.buildingId 
    INNER JOIN tenant ON guestTenant.tenantId = tenant.tenantId 
    INNER JOIN people ON tenant.peopleId = people.peopleId
    INNER JOIN contactInfo ON people.peopleId = contactInfo.peopleId 
ORDER BY guestTenant.guestTenantId ASC;

--Group average monthly salary by skill

SELECT 
    technician.skillId,
    skill.type AS Skill,
    COUNT(employee.employeeId) AS Number_Of_Skilled_Employees,
    ROUND(AVG(monthlySalary) , 2) AS Average_Salary_for_skill_type
FROM
    employee
        INNER JOIN
    technician ON employee.employeeId = technician.employeeId
        INNER JOIN
    skill ON technician.skillId = skill.skillId
GROUP BY skill.type
ORDER BY COUNT(employeeId) DESC;

