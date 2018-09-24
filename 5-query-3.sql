SELECT s.firstname, s.lastname, ROUND(AVG(a.grade), 2) AS moyenne
FROM assessment a
JOIN student s ON a.id_student = s.id
JOIN enrolment e ON s.id = e.id_student
JOIN year y ON e.id_year = y.id
WHERE y.id = 2
GROUP BY s.id
ORDER BY moyenne DESC, s.lastname ASC, s.firstname ASC;
