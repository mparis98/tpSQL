SELECT s.*, y.label
FROM student s
LEFT JOIN enrolment e ON s.id = e.id_student
LEFT JOIN year y ON e.id_year = y.id
WHERE e.from is NOT null
AND e.from <= "2017-07-01"
ORDER BY s.lastname ASC;