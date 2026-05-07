CREATE TABLE Stud_Marks (
    roll NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    total_marks NUMBER
);

CREATE TABLE Result (
    roll NUMBER,
    name VARCHAR2(50),
    class VARCHAR2(50)
);

INSERT INTO Stud_Marks VALUES (1, 'Amit', 1200);
INSERT INTO Stud_Marks VALUES (2, 'Priya', 950);
INSERT INTO Stud_Marks VALUES (3, 'Rahul', 850);
INSERT INTO Stud_Marks VALUES (4, 'Sneha', 1000);
INSERT INTO Stud_Marks VALUES (5, 'Karan', 910);

SELECT * FROM Stud_Marks;

CREATE OR REPLACE PROCEDURE proc_Grade(
    p_roll NUMBER,
    p_name VARCHAR2,
    p_marks NUMBER
)
IS
    v_class VARCHAR2(50);

BEGIN

    IF p_marks BETWEEN 990 AND 1500 THEN
        v_class := 'Distinction';

    ELSIF p_marks BETWEEN 900 AND 989 THEN
        v_class := 'First Class';

    ELSIF p_marks BETWEEN 825 AND 899 THEN
        v_class := 'Higher Second Class';

    ELSE
        v_class := 'Fail';

    END IF;

    INSERT INTO Result
    VALUES (p_roll, p_name, v_class);

END;
/

BEGIN

    FOR rec IN (SELECT * FROM Stud_Marks)

    LOOP

        proc_Grade(
            rec.roll,
            rec.name,
            rec.total_marks
        );

    END LOOP;

END;
/

SELECT * FROM Result;
