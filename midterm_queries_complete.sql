--Midterm Exam - Introduction to PostgreSQL
--CPT 166 - Fundamentals of SQL
--Sylvia Schlotterbeck 10-22-25

--Part B - SQL Queries

--1. List all students (student_id, first_name, last_name) sorted by last name.
SELECT *
FROM students
ORDER BY last_name;

--2. List all classes and how many credits each is worth.
SELECT class_name, credits
FROM classes;

--3. Show all registrations, displaying student name, class name, and grade.
SELECT CONCAT(first_name, ' ', last_name) AS student_name, class_name, grade
FROM students
INNER JOIN registrations ON students.student_id = registrations.student_id
INNER JOIN classes ON registrations.class_id = classes.class_id;

--4. Find all students registered for a class named “Why God, Why? : Investigating Existential Crises with Gusto”
SELECT CONCAT(first_name, ' ', last_name) AS students_registered_for_PHL327
FROM students
INNER JOIN registrations ON students.student_id = registrations.student_id
INNER JOIN classes ON registrations.class_id = classes.class_id
WHERE class_name = 'Why God, Why? : Investigating Existential Crises with Gusto';

--5. Count how many students are registered in each class.
SELECT class_name, COUNT(registration_id) as students_registered
FROM registrations
INNER JOIN classes ON registrations.class_id = classes.class_id
GROUP BY class_name
ORDER BY students_registered DESC;
 
--6. Show all students who are not registered for any class.
SELECT CONCAT(first_name, ' ', last_name) AS no_classes_registered
FROM students
FULL JOIN registrations ON students.student_id = registrations.student_id
WHERE registration_id IS NULL;
