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


-- correction du  precedent --
SELECT s.first_name,s.last_name FROM student AS s
INNER JOIN course AS c
ON s.course_id=c.course_id
WHERE c.course_name='Data Analyst';

--Lister les examens avec le prénom, nom de l’étudiant, le nom du cours, la note et la date.--
SELECT
s.first_name,
s.last_name,
c.course_name,
e.score,
e.exam_date
FROM exam e
INNER JOIN Student AS s ON e.student_id=s.student_id
INNER JOIN Course AS c ON e.Course_id=c.Course_id.

--Afficher tous les étudiants avec leur formation, y compris ceux sans formation.--
-- STUDENT IN GROUP A AND COURSES IN B--
SELECT
s.first_name,
s.last_name,
c.course_name
FROM student AS s
LEFT JOIN course AS c
ON s.Course_id=c.course_id
WHERE c.course_name IS NULL;
--TABLE1.NOMCOLONNE1(FK)=TABLE2.NOMCOLONNE2(fk)

--Afficher tous les étudiants avec leurs examens, même s’ils n’en ont pas passé.
-- A AS STUDENT AND B AS EXAM --
SELECT
s.first_name,
s.last_name,
e.exam_type
FROM exam AS e
LEFT JOIN student AS s
ON e.student_id=s.student_id;

-- Afficher toutes les formations même si aucun étudiant n'y est inscrit.--
-- STUDENT AS A AND COURSE AS B--

SELECT
s.first_name,
s.last_name,
c.course_name
FROM student AS s
RIGHT JOIN Course AS c
ON s.course_id=c.Course_id;

--Afficher les examens associés à un cours, y compris les cours sans examens (si possible).

SELECT 
e.exam_type,
c.course_name 
FROM exam AS e
RIGHT JOIN Course AS c
ON e.course_id=c.Course_id;

--Lister toutes les combinaisons étudiant-formation même sans correspondance.--
SELECT 
s.first_name,
s.last_name,
c.course_name
FROM student AS s
LEFT JOIN course AS c
ON s.course_id = c.course_id
UNION
SELECT 
s.first_name,
s.last_name,
c.course_name
FROM student AS s
RIGHT JOIN course AS c
ON s.course_id = c.course_id;

--Lister tous les examens et étudiants, même si l'un des deux est manquant.--

SELECT 
s.first_name,
s.last_name,
e.exam_type
FROM student AS s
LEFT JOIN exam AS e
ON s.student_id = e.student_id
UNION
SELECT 
s.first_name,
s.last_name,
e.exam_type
FROM student AS s
RIGHT JOIN exam AS e
ON s.student_id = e.student_id;

--Trouver les paires d’étudiants nés la même année.--
SELECT 
A.first_name AS student1,
B.first_name AS student2,
A.birth_year
FROM student AS A
JOIN student AS B
ON A.birth_year=B.birth_year
AND A.student_id > B.student_id;

--Associer chaque étudiant à ceux qui sont plus âgés qu’eux--

SELECT 
A.first_name AS student1,
B.first_name AS student2,
A.birth_year
B.birth_year
FROM student AS A
JOIN student AS B
ON A.birth_year > B.birth_year
AND A.student_id > B.student_id;

--Générer toutes les combinaisons possibles entre étudiants et types d’examen ('Écrit', 'Oral', 'Projet').

--Compter le nombre de lignes produites par ce CROSS JOIN.

SELECT 
*
FROM student 
CROSS JOIN exam ;

SELECT COUNT(*) 
FROM student
CROSS JOIN exam ;

-- 15 Afficher la moyenne des notes par étudiant.

SELECT
s.first_name,
s.last_name,
AVG(e.score)
FROM student AS s
JOIN exam AS e
ON s.student_id=e.student_id
GROUP BY s.student_id;

-- 16 Afficher la note maximale obtenue par cours.

select course_name,
MAX(e.score)
from course as c
JOIN exam AS e ON c.course_id=e.course_id
GROUP BY c.course_id;

-- 17 Lister les étudiants ayant obtenu une note supérieure à 15 à au moins un examen.

SELECT
s.first_name,
s.last_name,
e.score
FROM student s
JOIN exam e
ON s.student_id=e.student_id
WHERE e.score>15;