SELECT s.firstname, s.lastname, ROUND(AVG(a.grade), 2) AS moyenne
CASE 
      WHEN moyenne>=15 AND moyenne <= 20 THEN 'A'
      WHEN moyenne>=10 AND moyenne < 15 THEN 'B'
      WHEN moyenne>=5 AND moyenne < 10 THEN 'C'
      WHEN moyenne>=0 AND moyenne < 5 THEN 'D'
      ELSE 'null'
    END
FROM assessment a
JOIN student s ON a.id_student = s.id
JOIN enrolment e ON s.id = e.id_student
JOIN year y ON e.id_year = y.id
WHERE y.id = 2
GROUP BY e.from
ORDER BY moyenne DESC, s.lastname ASC;