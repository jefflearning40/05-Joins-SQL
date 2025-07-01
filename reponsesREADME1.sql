--Afficher les étudiants les plus jeunes--

SELECT * FROM student
WHERE birth_year=
(SELECT MAX(birth_year) FROM student);


--Afficher la moyenne générale des examens pour chaque étudiant

SELECT s.first_name,s.last_name,
(SELECT AVG(score) FROM exam e 
WHERE e.student_id=s.student_id) AS AVG_score FROM student AS s;

--Afficher les étudiants ayant obtenu la meilleure note dans le cours Développement Web.

SELECT 
s.student_id, 
s.first_name, 
s.last_name, 
e.score
FROM student AS s

JOIN exam e ON s.student_id = e.student_id
JOIN course c ON s.course_id=c.course_id
WHERE c.course_name='developpement web'
AND e.score=(SELECT MAX(score) FROM exam
JOIN course ON e.course_id=c.course_id
WHERE c.course_name='developpement web');

-- SECONDE VERSION--

SELECT s.student_id,
 s.first_name, 
 s.last_name, 
 e.score
FROM Student s
JOIN Exam e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id
WHERE c.course_name = 'Développement Web'
AND e.score = (SELECT MAX(score) FROM Exam WHERE course_id = c.course_id);


















