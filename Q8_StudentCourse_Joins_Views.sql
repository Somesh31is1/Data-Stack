CREATE DATABASE StudentCourseManagement;

USE StudentCourseManagement;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

DESC Students;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

DESC Courses;

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT CHECK (marks >= 0 AND marks <= 100),

    FOREIGN KEY (student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
    REFERENCES Courses(course_id)
);

DESC Enrollments;

INSERT INTO Students VALUES
(1, 'Amit Sharma', 'Pune'),
(2, 'Priya Patil', 'Mumbai'),
(3, 'Rahul Verma', 'Delhi'),
(4, 'Sneha Joshi', 'Nagpur'),
(5, 'Karan Mehta', 'Nashik'),
(6, 'Neha Singh', 'Chennai');

SELECT * FROM Students;

INSERT INTO Courses VALUES
(101, 'DBMS'),
(102, 'Java'),
(103, 'Python'),
(104, 'Operating Systems'),
(105, 'Computer Networks'),
(106, 'Machine Learning');

SELECT * FROM Courses;

INSERT INTO Enrollments VALUES
(1, 1, 101, 85),
(2, 2, 102, 92),
(3, 3, 103, 70),
(4, 4, 104, 88),
(5, 5, 105, 60);

SELECT * FROM Enrollments;

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Enrollments
INNER JOIN Students
ON Enrollments.student_id = Students.student_id
INNER JOIN Courses
ON Enrollments.course_id = Courses.course_id;

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Students
LEFT JOIN Enrollments
ON Students.student_id = Enrollments.student_id
LEFT JOIN Courses
ON Enrollments.course_id = Courses.course_id;

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Enrollments
RIGHT JOIN Courses
ON Enrollments.course_id = Courses.course_id
LEFT JOIN Students
ON Enrollments.student_id = Students.student_id;

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Students
LEFT JOIN Enrollments
ON Students.student_id = Enrollments.student_id
LEFT JOIN Courses
ON Enrollments.course_id = Courses.course_id

UNION

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Students
RIGHT JOIN Enrollments
ON Students.student_id = Enrollments.student_id
RIGHT JOIN Courses
ON Enrollments.course_id = Courses.course_id;

CREATE VIEW Student_Course_View AS

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Enrollments
INNER JOIN Students
ON Enrollments.student_id = Students.student_id
INNER JOIN Courses
ON Enrollments.course_id = Courses.course_id;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SELECT * FROM Student_Course_View;

CREATE VIEW High_Marks_View AS

SELECT
    Students.student_name,
    Courses.course_name,
    Enrollments.marks
FROM Enrollments
INNER JOIN Students
ON Enrollments.student_id = Students.student_id
INNER JOIN Courses
ON Enrollments.course_id = Courses.course_id
WHERE Enrollments.marks > 75;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SELECT * FROM High_Marks_View;

DROP VIEW High_Marks_View;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
