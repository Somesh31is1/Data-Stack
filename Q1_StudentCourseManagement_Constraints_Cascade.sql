CREATE DATABASE StudentCourseDB;

USE StudentCourseDB;

CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phno BIGINT,
    email_id VARCHAR(100) UNIQUE,
    marks INT CHECK (marks >= 0 AND marks <= 100)
);

CREATE TABLE Courses (
    c_id INT PRIMARY KEY,
    cname VARCHAR(100) NOT NULL,
    rollno INT,
    
    FOREIGN KEY (rollno)
    REFERENCES Student(rollno)
    ON DELETE CASCADE
);

INSERT INTO Student VALUES
(1, 'Amit Sharma', 'Pune', 9876543210, 'amit@gmail.com', 85),
(2, 'Priya Patil', 'Mumbai', 9876543211, 'priya@gmail.com', 92),
(3, 'Rahul Verma', 'Delhi', 9876543212, 'rahul@gmail.com', 76),
(4, 'Sneha Joshi', 'Nagpur', 9876543213, 'sneha@gmail.com', 88),
(5, 'Karan Mehta', 'Nashik', 9876543214, 'karan@gmail.com', 67),
(6, 'Neha Singh', 'Chennai', 9876543215, 'neha@gmail.com', 95),
(7, 'Rohit Das', 'Kolkata', 9876543216, 'rohit@gmail.com', 81),
(8, 'Pooja Nair', 'Kerala', 9876543217, 'pooja@gmail.com', 73);

INSERT INTO Courses VALUES
(101, 'DBMS', 1),
(102, 'Java', 2),
(103, 'Python', 3),
(104, 'Computer Networks', 4),
(105, 'Operating Systems', 5),
(106, 'Data Structures', 6),
(107, 'Cloud Computing', 7),
(108, 'Machine Learning', 8);

SELECT * FROM Student;

SELECT * FROM Courses;

INSERT INTO Student VALUES
(1, 'Test User', 'Pune', 9999999999, 'test@gmail.com', 80);

INSERT INTO Student VALUES
(9, NULL, 'Pune', 9999999999, 'null@gmail.com', 75);

INSERT INTO Student VALUES
(10, 'Same Email', 'Mumbai', 9999999998, 'amit@gmail.com', 70);

INSERT INTO Student VALUES
(11, 'Invalid Marks', 'Delhi', 9999999997, 'invalid@gmail.com', 150);

INSERT INTO Courses VALUES
(109, 'AI', 50);

ALTER TABLE Student
ADD age INT;

DESC Student;

RENAME TABLE Courses TO CourseDetails;

SELECT * FROM CourseDetails;

DELETE FROM Student
WHERE rollno = 1;

SELECT * FROM Student;

SELECT * FROM CourseDetails;

TRUNCATE TABLE CourseDetails;

SELECT * FROM CourseDetails;

DROP TABLE CourseDetails;

DROP TABLE Student;

DROP DATABASE StudentCourseDB;
