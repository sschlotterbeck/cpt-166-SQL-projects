--Midterm Exam - Introduction to PostgreSQL
--CPT 166 - Fundamentals of SQL
--Sylvia Schlotterbeck 10-22-25

--Part A - Database Creation

CREATE DATABASE school_db;

CREATE TABLE semester (
  semester_id CHAR(8) PRIMARY KEY,
  semester_name TEXT
  );

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(25),
  last_name VARCHAR(40),
  enrolled_date DATE
  );

ALTER SEQUENCE students_student_id_seq RESTART WITH 1001;

CREATE TABLE classes (
  class_id CHAR(6) PRIMARY KEY,
  class_name VARCHAR(75),
  credits SMALLINT
  );
  
CREATE TABLE registrations (
  registration_id SERIAL PRIMARY KEY,
  student_id SERIAL references students(student_id),
  class_id CHAR(6) references classes(class_id),
  semester_id CHAR(8) references semester(semester_id),
  grade VARCHAR(3)
  );
  
INSERT INTO students (first_name, last_name, enrolled_date) VALUES
  ('Harold', 'Crayon', '2020-01-01'),
  ('Wrigley', 'Jenkins', '2025-07-07'),
  ('Jabba', 'Hutt', '2025-06-01'),
  ('Geraldine', 'Guerrera', '2021-10-31'),
  ('Fatima', 'Ali', '2022-05-23'),
  ('Sylvia', 'Stalagtite', '2025-06-01'),
  ('Louis', 'Lewis', '2022-02-02'),
  ('Priscilla', 'Pencilbox', '2024-09-03'),
  ('Cassius', 'Claye', '2025-09-01'),
  ('Killian', 'Paz', '2019-08-18');

INSERT INTO classes (class_id, class_name, credits) VALUES
  ('ERG101', 'The Wide World of Widgets', 3),
  ('ERG202', 'Widgets and You: A Personal Approach to Widget Design', 3),
  ('ERG301', 'Advanced Widget Design', 4),
  ('PHL101', 'What Does It All Mean?', 3),
  ('PHL204', 'Contemporary Fissures in Philosophy', 3),
  ('PHL327', 'Why God, Why? : Investigating Existential Crises with Gusto', 4);

INSERT INTO semester (semester_id, semester_name) VALUES
  ('2025-FAL', '2025 Fall Semester'),
  ('2026-SPR', '2026 Spring Semester');

INSERT INTO registrations (student_id, class_id, semester_id, grade) VALUES
  (1010, 'ERG202', '2025-FAL', 'B+'),
  (1001, 'PHL327', '2025-FAL', 'A'),
  (1002, 'PHL327', '2025-FAL', 'A-'),
  (1003, 'PHL327', '2025-FAL', 'INC'),
  (1008, 'PHL101', '2026-SPR', 'NA'),
  (1006, 'PHL101', '2026-SPR', 'NA') 
;