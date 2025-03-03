CREATE DATABASE degree_college;
show databases;
USE`degree_college`;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL);
select * from departments;
INSERT INTO departments (department_id, department_name) 
VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry');



CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    FOREIGN KEY (department_id) REFERENCES departments(department_id));
select *from faculty;
INSERT INTO faculty (first_name, last_name, department_id, email, phone_number) VALUES
('Kavitha', 'MUDIYAM', 1, 'kavitha@gmail.com', '1234567890'),
('Lahari', 'GUDDAM', 2, 'lahari@gmail.com', '1234567891'),
('Sirisha', 'GANDU', 3, 'sirisha@gmail.com', '1234567892'),
('Samreen', 'SHAIK', 4, 'samreen@gmail.com', '1234567871');



CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    course_credits INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id));
select * from courses;
INSERT INTO courses (  course_id,course_name, department_id, course_credits) VALUES
(101,'Data Structures', 1, 4),
(102,'Calculus I', 2, 3),
(103,'Physics I', 3, 4),
(104,'Organic Chemistry', 4, 3);



CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    department_id INT,
    date_of_birth DATE
  );
    select * from students;

INSERT INTO students (student_id,first_name, last_name, email, phone_number, department_id, date_of_birth) VALUES
(1,'Amrutha', 'Jangam', 'amrutha@gmail.com', '9876543210', 1, '2000-05-15'),
(2,'Sri lakshmi', 'Valmiki', 'valmiki@gmail.com', '9876543211', 2, '2000-08-20'),
(3,'Malini', 'Pocha', 'malini@gmail.com', '9876543280', 3, '2000-05-15')
;


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id));
select * from enrollments;
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-02-01'),
(1, 2, '2025-02-01'),
(2, 3, '2025-02-01');



CREATE TABLE depart (
    department_id INT,
    faculty_id INT,
    PRIMARY KEY (department_id, faculty_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id));
select * from depart;
INSERT INTO depart (department_id, faculty_id) VALUES
(1, 1),  
(2, 2), 
(3, 3);
ALTER TABLE depart
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id),
ADD FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id);





CREATE TABLE results (
    result_id INT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);


select * from results;

INSERT INTO results (result_id, student_id, exam_id, grade)
VALUES
(1, 1, 1, 'A'),  
(2, 1, 2, 'B'),  
(3, 2, 3, 'C');  



SELECT 
    students.student_id,
    students.first_name,
    students.last_name,
    students.email,
    students.phone_number,
    students.date_of_birth,
    courses.course_id,
    courses.course_name,
    courses.course_credits
FROM students
INNER JOIN 
courses ON students.department_id = courses.department_id;
SELECT * FROM students WHERE student_id = 2;

SELECT 
    course_id,
    course_name,
    course_credits
FROM courses
ORDER BY course_credits DESC;

SELECT 
    departments.department_name,
    COUNT(students.student_id) AS student_count
FROM students
INNER JOIN departments ON students.department_id = departments.department_id
GROUP BY departments.department_name
ORDER BY departments.department_name;









