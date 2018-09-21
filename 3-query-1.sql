SELECT *
FROM student s
LEFT JOIN enrolment e ON s.id = e.id_student
WHERE e.from is NOT null
AND e.from <= "2017-07-01"
ORDER BY s.lastname ASC;