CREATE DATABASE StudentCourseManagement;

USE StudentCourseManagement;

CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phno VARCHAR(15),
    email_id VARCHAR(100) UNIQUE,
    marks INT CHECK (marks >= 0 AND marks <= 100)
);

CREATE TABLE Courses (
    c_id INT PRIMARY KEY,
    cname VARCHAR(100) NOT NULL,
    rollno INT,
    FOREIGN KEY (rollno) REFERENCES Student(rollno)
    ON DELETE CASCADE
);

DESC Student;

DESC Courses;

ALTER TABLE Student
ADD age INT;

DESC Student;

ALTER TABLE Student
RENAME COLUMN phno TO phone_no;

DESC Student;

RENAME TABLE Courses TO Course;

DESC Course;

INSERT INTO Student
VALUES
(1, 'Amit Sharma', 'Pune', '9876543210', 'amit@gmail.com', 85, 20),
(2, 'Neha Patil', 'Mumbai', '9876543211', 'neha@gmail.com', 90, 21),
(3, 'Rohit Verma', 'Nashik', '9876543212', 'rohit@gmail.com', 78, 22),
(4, 'Sneha Kulkarni', 'Nagpur', '9876543213', 'sneha@gmail.com', 88, 20),
(5, 'Karan Mehta', 'Delhi', '9876543214', 'karan@gmail.com', 67, 23),
(6, 'Priya Singh', 'Pune', '9876543215', 'priya@gmail.com', 92, 21),
(7, 'Rahul Joshi', 'Satara', '9876543216', 'rahul@gmail.com', 74, 22),
(8, 'Anjali Deshmukh', 'Kolhapur', '9876543217', 'anjali@gmail.com', 81, 20);

INSERT INTO Course
VALUES
(101, 'DBMS', 1),
(102, 'Operating System', 2),
(103, 'Computer Networks', 3),
(104, 'Java', 4),
(105, 'Python', 5),
(106, 'Data Structures', 6),
(107, 'AI', 7),
(108, 'Machine Learning', 8);

SELECT * FROM Student;

SELECT * FROM Course;

INSERT INTO Student
VALUES
(9, NULL, 'Pune', '9876543299', 'test@gmail.com', 80, 20);

INSERT INTO Student
VALUES
(10, 'Test User', 'Pune', '9876543288', 'amit@gmail.com', 75, 21);

INSERT INTO Student
VALUES
(11, 'Invalid Marks', 'Pune', '9876543277', 'invalid@gmail.com', 150, 22);

INSERT INTO Course
VALUES
(109, 'Cyber Security', 50);

DELETE FROM Student
WHERE rollno = 1;

SELECT * FROM Student;

SELECT * FROM Course;

TRUNCATE TABLE Course;

DROP TABLE Course;

DROP TABLE Student;
