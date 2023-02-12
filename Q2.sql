CREATE SCHEMA q2;
USE q2;

CREATE TABLE employees(
`Name` VARCHAR(3) PRIMARY KEY ,
`Jan` DECIMAL(10,2) NOT NULL,
`Feb` DECIMAL(10,2) NOT NULL,
`March` DECIMAL(10,2) NOT NULL 
);

INSERT INTO employees VALUES
('X','5200','9093','3832'),
('Y','9023','8942','4000'),
('Z','9834','8197','9903'),
('W','3244','4321','0293');

SELECT * FROM employees;

SELECT * FROM
-- Created a table with Name, Salary and Month Name with UNION
(SELECT `Name`, Jan AS `Value`, "Jan" AS `Month` FROM employees
UNION 
SELECT `Name`, Feb, "Feb" FROM employees
UNION
SELECT `Name`, March, "March" FROM employees) AS required_table
-- Now I want to match the above table with a table that just contains max salary for each employee
-- For that I can just calculate max salary in each row using GREATEST
WHERE 
-- Using EXISTS for matching since this was the only one that could be used to match multiple columns
EXISTS (SELECT '' FROM employees AS emp
WHERE required_table.`Name` = emp.`Name` AND required_table.`Value` = GREATEST(emp.Jan, emp.Feb, emp.March));






-- ----------------------------------PLEASE IGNORE-------------------------------------------------

-- DELIMITER $$
-- CREATE FUNCTION get_month (`Name` VARCHAR(3), `Jan` DECIMAL(10,2), `Feb` DECIMAL(10,2), `March` DECIMAL(10,2))
-- RETURNS VARCHAR(8) DETERMINISTIC
-- BEGIN
-- DECLARE max_salary DECIMAL(10,2);
-- DECLARE `month` VARCHAR(8);
-- SET max_salary = GREATEST(Jan, Feb, March);
-- CASE max_salary
-- 	WHEN Jan THEN SET `month` = "Jan";
--     WHEN Feb THEN SET `month` = "Feb";
--     WHEN March THEN SET `month` = "March";
-- END CASE;
-- RETURN `month`;
-- END $$
-- DELIMITER ;

-- DROP FUNCTION func;

-- SELECT `Name`, GREATEST(Jan, Feb, March) AS `Value`, get_month(`Name`, `Jan`, `Feb`, `March`) AS `Month` FROM employees;