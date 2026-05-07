CREATE TABLE Employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER
);

INSERT INTO Employee VALUES (1, 'Amit', 'HR', 25000);
INSERT INTO Employee VALUES (2, 'Priya', 'IT', 30000);
INSERT INTO Employee VALUES (3, 'Rahul', 'Finance', 28000);
INSERT INTO Employee VALUES (4, 'Sneha', 'Marketing', 35000);
INSERT INTO Employee VALUES (5, 'Karan', 'IT', 40000);
INSERT INTO Employee VALUES (6, 'Neha', 'Sales', 22000);
INSERT INTO Employee VALUES (7, 'Rohit', 'Admin', 18000);
INSERT INTO Employee VALUES (8, 'Pooja', 'HR', 27000);

SELECT * FROM Employee;

CREATE OR REPLACE TRIGGER salary_check
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF :NEW.salary < 10000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary must be at least 10000');
    END IF;
END;
/

INSERT INTO Employee VALUES (9, 'Akash', 'IT', 15000);

INSERT INTO Employee VALUES (10, 'Raj', 'HR', 5000);

SET SERVEROUTPUT ON;

DECLARE
    v_id Employee.emp_id%TYPE;
    v_name Employee.emp_name%TYPE;
    v_dept Employee.department%TYPE;
    v_salary Employee.salary%TYPE;
    total_salary NUMBER := 0;

    CURSOR emp_cursor IS
    SELECT * FROM Employee;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor
        INTO v_id, v_name, v_dept, v_salary;

        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_id || ' ' ||
            v_name || ' ' ||
            v_dept || ' ' ||
            v_salary
        );

        total_salary := total_salary + v_salary;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Salary = ' || total_salary);

    CLOSE emp_cursor;

END;
/
