CREATE SCHEMA q4;
USE q4;

CREATE TABLE id_email (
Candidate_ID INT PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR(14) NOT NULL
);

DROP TABLE id_email;
INSERT INTO id_email VALUES
('45','abc@gmail.com'),
('23','def@yahoo.com'),
('34','abc@gmail.com'),
('21','bcf@gmail.com'),
('94','def@yahoo.com');

DELETE FROM id_email WHERE Candidate_ID NOT IN (SELECT min_id FROM (SELECT MIN(Candidate_ID) AS min_id FROM id_email GROUP BY Email) AS temp);

SELECT * FROM id_email;