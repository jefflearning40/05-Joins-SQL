--AFFICHER LE NOM COMPLET DE STUDENT ET INTIULE DU COURS--
SELECT s.first_name,s.last_name,c.course_name FROM student AS s
INNER JOIN course AS c
ON s.course_id = c.course_id;

-- version longue --
SELECT student.first_name,student.last_name,course.course_name
FROM student
INNER JOIN course
ON student.course_id=course.course.id;
+------------+-----------+---------------------------+
| first_name | last_name | course_name               |
+------------+-----------+---------------------------+
| Sofia      | Martin    | Développement Web         |
| Ali        | Kacem     | Data Analyst              |
| Tom        | Lemoine   | Data Analyst              |
| Julie      | Durand    | Cybersécurité             |
| Emma       | Rossi     | Intelligence Artificielle |
+------------+-----------+---------------------------+

-- Lister les étudiants inscrits en "Data Analyst".--

SELECT s.first_name,s.last_name,c.course_name FROM student AS s
INNER JOIN course AS c
ON student.course_id=course.course_id;
WHERE course.course_name= 'Data Analyst';