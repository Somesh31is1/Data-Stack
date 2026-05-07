CREATE DATABASE company;

USE company;

CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    hiredate DATE,
    salary DECIMAL(10,2),
    commission DECIMAL(10,2),
    deptno INT,

    FOREIGN KEY (deptno)
    REFERENCES dept(deptno)
);

INSERT INTO dept VALUES
(10, 'HR', 'Pune'),
(20, 'Dev', 'Mumbai'),
(30, 'Sales', 'Delhi'),
(40, 'Testing', 'Chennai');

INSERT INTO Emp VALUES
(101, 'Amit', 'Manager', '2023-01-10', 50000, 5000, 10),
(102, 'Isha', 'Salesman', '2022-03-15', 30000, 3000, 30),
(103, 'Rahul', 'Developer', '2021-06-20', 45000, 2000, 20),
(104, 'Irfan', 'Salesman', '2020-07-12', 35000, 4000, 30),
(105, 'Sneha', 'Tester', '2022-09-18', 28000, 1000, 40),
(106, 'Karan', 'Developer', '2021-11-25', 47000, 1500, 20),
(107, 'Pooja', 'HR', '2023-02-05', 32000, 1200, 10);

SELECT * FROM dept;

SELECT * FROM Emp;

SELECT MAX(salary) AS max_salary
FROM Emp
WHERE job = 'Salesman';

SELECT *
FROM Emp
WHERE ename LIKE 'I%';

SELECT *
FROM Emp
ORDER BY salary DESC;

SELECT
    hiredate,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary
FROM Emp
WHERE deptno = 10
GROUP BY hiredate;

SELECT
    Emp.ename,
    dept.deptname
FROM Emp
INNER JOIN dept
ON Emp.deptno = dept.deptno;

SELECT
    dept.deptname,
    SUM(Emp.salary) AS total_salary
FROM Emp
INNER JOIN dept
ON Emp.deptno = dept.deptno
GROUP BY dept.deptname;

SELECT *
FROM Emp
WHERE deptno = (
    SELECT deptno
    FROM dept
    WHERE deptname = 'Dev'
);
