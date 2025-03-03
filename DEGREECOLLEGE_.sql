create database Degreecollege;
show databases;
USE `Degreecollege`;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Department VARCHAR(50),
    YearOfStudy VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);
select * from Students;

INSERT INTO Students (StudentID, Name, Age, Department, YearOfStudy, PhoneNumber, Email)
VALUES
(1, 'Sravani', 20, 'Computer Science', '2nd', '123-456-7890', 'sravani@email.com'),
(2, 'Sirisha', 22, 'Mathematics', '3rd', '234-567-8901', 'siri@email.com'),
(3, 'Lahari', 21, 'Physics', '1st', '345-678-9012', 'lahari@email.com'),
(4, 'Amrutha', 23, 'Chemistry', '4th', '456-789-0123', 'amrutha@email.com'),
(5, 'Jhansi', 20, 'History', '2nd', '567-890-1234', 'jhansi@email.com'),
(6, 'Venkata Kavitha', 22, 'English', '3rd', '678-901-2345', 'kavitha@email.com'),
(7, 'Malini', 21, 'Biology', '1st', '789-012-3456', 'malini@email.com'),
(8, 'Rehana', 22, 'Economics', '4th', '890-123-4567', 'rehana@email.com'),
(9, 'Sri Lakshmi', 20, 'Sociology', '2nd', '901-234-5678', 'srilakshmi@email.com'),
(10, 'Samreen', 23, 'Political Science', '3rd', '012-345-6789', 'samreen@email.com');

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY AUTO_INCREMENT, 
    FirstName VARCHAR(50) NOT NULL,           
    LastName VARCHAR(50) NOT NULL,             
    Department VARCHAR(100) NOT NULL,        
    Email VARCHAR(100) NOT NULL UNIQUE,       
    PhoneNumber VARCHAR(15),               
    Designation VARCHAR(50),                  
    DateOfJoining DATE NOT NULL,               
    Salary Integer                    
);
select * from Faculty;
INSERT INTO Faculty (FirstName, LastName, Department, Email, PhoneNumber, Designation, DateOfJoining, Salary)
VALUES
('Tulasi', 'mam', 'Computer Science', 'tulasi@college.edu', '123-456-7890', 'Professor', '2015-08-01', 75000.00),
('Sandhya ', 'mam', 'Mathematics', 'sandya@college.edu', '987-654-3210', 'Assistant Professor', '2018-01-15', 60000.00),
('Karuna', 'mam', 'Physics', 'karuna@college.edu', '555-123-4567', 'Lecturer', '2020-06-22', 45000.00),
('Mubeena', 'mam', 'Chemistry', 'mubeena@college.edu', '555-987-6543', 'Professor', '2012-09-10', 82000.00),
('Manjula', 'mam', 'Biology', 'manjula@college.edu', '444-555-6666', 'Assistant Professor', '2016-03-30', 65000.00),
('Sirisha', 'mam', 'English', 'sirisha@college.edu', '333-777-8888', 'Lecturer', '2022-01-20', 47000.00);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY  AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    department_head VARCHAR(100),
    number_of_faculty INT,
    established_year INT
);

select * from Departments;

INSERT INTO Departments (department_id,department_name, department_head, number_of_faculty, established_year)
VALUES
(1,'Computer Science', 'Dr. John Doe', 25, 1995),
(2,'Mathematics', 'Dr. Alice Smith', 20, 1990),
(3,'Physics', 'Dr. Robert Brown', 15, 1985),
(4,'Chemistry', 'Dr. Sarah Davis', 18, 1992),
(5,'English', 'Dr. Emily Clark', 12, 2000);

CREATE TABLE Results (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    department_id INT NOT NULL,
    subject_name VARCHAR(100),
    marks_obtained DECIMAL(5,2),
    total_marks DECIMAL(5,2),
    result_status ENUM('Pass', 'Fail') NOT NULL,
    semester INT,
    exam_year INT
 
);

select * from Results;

INSERT INTO Results (student_id, department_id, subject_name, marks_obtained, total_marks, result_status, semester, exam_year)
VALUES
(1, 1, 'Data Structures', 85.50, 100.00, 'Pass', 2, 2024),
(2, 2, 'Calculus', 92.00, 100.00, 'Pass', 3, 2024),
(3, 3, 'Quantum Mechanics', 70.00, 100.00, 'Pass', 4, 2024),
(4, 4, 'Organic Chemistry', 65.75, 100.00, 'Fail', 2, 2024),
(5, 5, 'Literature Analysis', 88.25, 100.00, 'Pass', 1, 2024);


CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    date DATE,
    status VARCHAR(10),
    remarks VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES students(StudentID)
);
select * from attendance;
INSERT INTO attendance (StudentID,  date, status, remarks)
VALUES 
(1,  '2025-03-01', 'Present', 'No remarks'),
(2,  '2025-03-01', 'Absent', 'Family emergency'),
(3,  '2025-03-01', 'Present', 'On time'),
(4,  '2025-03-01', 'Late', 'Traffic issues'),
(5,  '2025-03-01', 'Absent', 'Sick leave'),
(6,  '2025-03-02', 'Present', 'No remarks'),
(7,  '2025-03-02', 'Late', 'Delayed due to meeting'),
(8,  '2025-03-02', 'Absent', 'Out of town'),
(9,  '2025-03-02', 'Present', 'No remarks'),
(10,  '2025-03-02', 'Present', 'No remarks');

CREATE TABLE login (
    id INT PRIMARY KEY,
    username VARCHAR(100),
    password VARCHAR(100),
    usertype VARCHAR(50),
    datetime DATETIME,
    loginstatus VARCHAR(20)
);
select * from login;


INSERT INTO login (id,username, password, usertype, loginstatus) 
VALUES
(1,'john_doe', 'hashed_password_123', 'user', 'success'),
(2,'jane_doe', 'hashed_password_456', 'admin', 'failed'),
(3,'alice_smith', 'hashed_password_789', 'user', 'success'),
(4,'bob_jones', 'hashed_password_321', 'user', 'failed'),
(5,'mary_johnson', 'hashed_password_654', 'admin', 'success'),
(6,'david_brown', 'hashed_password_987', 'user', 'success'),
(7,'susan_clark', 'hashed_password_654321', 'user', 'failed'),
(8,'michael_white', 'hashed_password_111222', 'user', 'success'),
(9,'linda_garcia', 'hashed_password_333444', 'admin', 'failed'),
(10,'robert_miller', 'hashed_password_555666', 'user', 'success');





