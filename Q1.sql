CREATE SCHEMA q1;
USE q1;

CREATE TABLE employees
(
-- Employee id has to be primary key
EmpID INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(8) NOT NULL,
Gender ENUM('Male', 'Female') NOT NULL,
Department ENUM('IT', 'HR', 'Finance') NOT NULL);

INSERT INTO employees VALUES 
('1','X','Female','Finance'),
('2','Y','Male','IT'),
('3','Z','Male','HR'),
('4','W','Female','IT');

SELECT * FROM employees;

-- Need full join of two tables. One table is for female count and other for male count. In MySQL there is no full join.
-- Therefore using union of left and right join
SELECT Department, `No of Males`, `No of Females` FROM 
-- The below SELECT if for the table that contains information for count of males
(SELECT Department, COUNT(Gender) AS `No of Males` FROM employees WHERE Gender = 'Male' GROUP BY Department) AS mdep 
LEFT JOIN 
-- The below SELECT if for the table that contains information for count of females
(SELECT Department, COUNT(Gender) AS `No of Females` FROM employees WHERE Gender = 'Female' GROUP BY Department) AS wdep 
USING (Department)

UNION 

-- Repeating the same procedure as above but using right join instead.
SELECT Department, `No of Males`, `No of Females` FROM
(SELECT Department, COUNT(Gender) AS `No of Males` FROM employees WHERE Gender = 'Male' GROUP BY Department) AS mdep 
RIGHT JOIN 
(SELECT Department, COUNT(Gender) AS `No of Females` FROM employees WHERE Gender = 'Female' GROUP BY Department) AS wdep 
USING (Department);