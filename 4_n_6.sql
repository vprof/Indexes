/*4.1*/
CREATE VIEW contact_info AS 
SELECT e.name, e.phone, p.address
FROM employees e
INNER JOIN personalinfo p ON e.e_id = p.e_id;

/*4.2*/
CREATE VIEW unmarried_birthdays AS 
SELECT e.name, e.phone, p.birthday
FROM employees e
INNER JOIN personalinfo p ON e.e_id = p.e_id
LEFT JOIN (
    SELECT e_id, marital_status
    FROM personalinfo
    WHERE marital_status = 'married'
) m ON e.e_id = m.e_id
WHERE m.e_id IS NULL;

/*4.3*/
CREATE VIEW manager_info AS 
SELECT e.name, e.phone, p.birthday
FROM employees e
INNER JOIN personalinfo p ON e.e_id = p.e_id
INNER JOIN salary s ON e.e_id = s.e_id
WHERE s.job_title = 'PM';

/*6*/
DROP TABLE IF EXISTS customers;
CREATE TABLE `customers` (
  `CustomerNo` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LName` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MName` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address1` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Address2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Phone` char(12) NOT NULL,
  `DateInSystem` date DEFAULT NULL,
  PRIMARY KEY (`CustomerNo`)
);

CREATE INDEX idx_FName ON `customers` (`FName`);
CREATE INDEX idx_LName ON `customers` (`LName`);
CREATE INDEX idx_City ON `customers` (`City`);

ANALYZE TABLE `customers`;