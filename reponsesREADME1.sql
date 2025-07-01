--Afficher les étudiants les plus jeunes--

SELECT * FROM student
WHERE birth_year=
(SELECT MAX(birth_year) FROM student);


--Afficher la moyenne générale des examens pour chaque étudiant

SELECT s.first_name,s.last_name,
(SELECT AVG(score) FROM exam e 
WHERE e.student_id=s.student_id) AS AVG_score FROM student AS s;

