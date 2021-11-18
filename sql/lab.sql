CREATE PROCEDURE add_employee (
    IN Fname VARCHAR(15),
    IN Minit CHAR,
    IN Lname VARCHAR(15),
    IN Ssn CHAR(9),
    IN Bdate DATE,
    IN Address VARCHAR(30),
    IN Sex CHAR,
    IN Salary DECIMAL(10,2),
    IN Super_ssn CHAR(9),
    IN Dno INT
)
BEGIN
	DECLARE Super_ssn CHAR(9);
    DECLARE Dno INT;

    SET Super_ssn = (
        SELECT 
        	employee.Ssn
        FROM
        	employee
       	WHERE
        	employee.Fname = Super_fname
    );
    
    SET Dno = (
        SELECT 
        	department.Dnumber
        FROM
        	department
       	WHERE
        	department.Dname = Dname
    );
    
	INSERT INTO
    	employee
	VALUES
    	(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno);
END;










1.
UL = {A, D}
UR = {}
UB = {B, C, E}

UL+ = {A, D}

{A, D, B}+ = {A, B, C, D, E} -> KEY
{A, D, C}+ = {A, C, D, E, B} -> KEY
{A, D, E}+ = {A, D, E, B, C} -> KEY



2.
a)
UL = {A, B, D}
UR = {C, E, F, G, I, J}
UB = {H}

UL+ = {A, B, D, C, E, F, G, H, I, J} = U
-> UL is the only key

b)
R(A, B, D, C, E, F, G, H, I, J)
    
2NF
R1(A, B, D, E, F, G, H, I, J)
R2(A, B, C)

R11(A, D, G, H, I, J)
R12(B, D, E, F)
R2(A, B, C)

R111(A, B, D, I, J)
R112(A, D, G, H)
R12(B, D, E, F)
R2(A, B, C)

R1111(A, B, D, J)
R1112(A, I)
R112(A, D, G, H)
R12(B, D, E, F)
R2(A, B, C)

R1111(A, B, D, J)
R1112(A, I)
R112(A, D, G, H)
R12(B, D, E, F)
R2(A, B, C)




3NF

3.
R(Doctor, Patient, Date, Diagnosis, Treat_code, Charge)

Doctor, Patient, Date -> Diagnosis, Treat_code
Treat_code -> Charge

2NF
R(Doctor, Patient, Date, Diagnosis, Treat_code, Charge)

3NF
R1(Doctor, Patient, Date, Diagnosis, Treat_code) K:(Doctor, Patient, Date)
R2(Treat_code, Charge) K:(Treat_code)


4.
R (Course_no, Sec_no, Offering_dept, Credit_hours, Course_level, Instructor_ssn, Semester, 
Year, Days_hours, Room_no, No_of_students)

UL = {Semester, Year}
UR = {Offering_dept, Credit_hours, Course_level, No_of_students, Instructor_ssn}
UB = {Course_no, Sec_no, Days_hours, Room_no}


UL+ = {Semester, Year} != U

{Semester, Year, Course_no, Sec_no}+ = U
{Semester, Year, Room_no, Days_hours}+ = U


Normalization
Key: {Semester, Year, Course_no, Sec_no}
    1NF: 
    R(Course_no, Sec_no, Offering_dept, Credit_hours, Course_level, Instructor_ssn, Semester, 
    Year, Days_hours, Room_no, No_of_students)

    2NF:
    R1(
        {Course_no},
        Offering_dept,  Credit_hours,  Course_level
    )
    R2(
        {Year, Semester, Course_no, Sec_no},
        Instructor_ssn,  Days_hours, Room_no, No_of_students
    )



R(part_no, desc, supp, supp_add, price)
part_no, supp -> price
part_no -> desc
supp -> supp_add

1NF
(part_no, supp), desc, supp_add, price

2NF, 3NF, BCNF: 
(part_no, supp), price
(part_no) desc, 
(supp), supp_add














R(A, B, C, D, E, F, G, H, I)

UL = {A, B}
UR = {C, E, F, G, I, J}
UB = {D, F}

UL+ = {A, B, C, D, E, F, G, H, I, J} = U

1NF:
(A, B), C, D, E, F, G, H, I

2NF:
(A, B), C
(A), D, E,I,J
(B), F,G,H

3NF:
(A, B), C
(A), D, E
(D),I,J
(B), F
(F),G,H