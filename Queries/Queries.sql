-- Queries
SELECT 
    p.`firstName` as 'First Name',
    p.`lastName` as 'Last Name'
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

