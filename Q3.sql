CREATE SCHEMA q3;
USE q3;

CREATE TABLE Scores
(
Candidate_ID INT PRIMARY KEY AUTO_INCREMENT,
Marks INT NOT NULL
);

INSERT INTO Scores VALUES
('1','98'),
('2','78'),
('3','87'),
('4','98'),
('5','78');

-- Used GROUP_CONCAT to join rows
-- Used a variable to give rank
SELECT Marks, (@rk := @rk + 1) AS `Rank` , GROUP_CONCAT(Candidate_ID SEPARATOR ', ') AS `Cadidate_ID(s)`
FROM Scores, (SELECT @rk:=0) AS `rank` GROUP BY Marks ORDER BY Marks DESC;