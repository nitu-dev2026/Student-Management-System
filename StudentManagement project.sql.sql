CREATE DATABASE StudentManagement;
USE StudentManagement;
CREATE TABLE Student(
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)  NOT NULL,
  age INT,
  gender VARCHAR(10),
  course VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(15)
  );
   INSERT INTO Student (name,age,gender,course,email,phone) VALUES
   ('Nitu',20,'Female', 'Bca', 'nitu@gmail.com','9241456789'),
   ('Addy',21, 'Male', 'Bca', 'addy@gmail.com', '7488773075'),
   ('Bhumi', 20, 'Female', 'BBA', 'bhumi@gamil.com','7488546231'),
   ('Akash',22,'Male','BBA','akash@gmail.com','8456792130');
   SELECT*FROM Student;
   CREATE TABLE Course(
   course_id INT PRIMARY KEY AUTO_INCREMENT,
   course_name VARCHAR(50) NOT NULL,
   duration VARCHAR(20),
   fees DECIMAL(10,2)
   );
INSERT INTO Course(course_name,duration, fees) VALUES
('Bca','3Years', 60000),
('Bca','3Years', 70000),
('BBA','2Years', 80000),
('BBA','2Years', 90000);

SELECT*FROM Course;
USE StudentManagement;


CREATE TABLE Teacher(
teacher_id INT PRIMARY KEY AUTO_INCREMENT,
teacher_name VARCHAR(50) NOT NULL,
subject VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(15)
);
SELECT*FROM Teacher;




INSERT INTO Teacher(teacher_name,subject,email,phone) VALUES
('Ravi','DBMS','ravi@gmail.com','9241244874'),
('Aman','HTML','vivek@gmail.com','8987844560'),
('Babita','SQL','babita@gmail.com','7488773075'),
('Tanu','CN','tanu@gmail.com','6547891230');

CREATE TABLE Enrollment(
enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
course_id INT,
enrollment_date DATE
);

INSERT INTO Enrollment(student_id,course_id,enrollment_date) VALUES
(1,1,'2026-09-22'),
(2,1,'2026-09-22'),
(3,3,'2026-09-22'),
(4,4,'2026-09-22');

SELECT*FROM Enrollment;

CREATE TABLE  Marks(
marks_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
subject VARCHAR(50),
marks INT,
exam_type VARCHAR(30)
);

INSERT INTO Marks(student_id,subject,marks,exam_type) VALUES
(1,'DBMS',78,'Semester'),
(2,'HTML',85,'Semester'),
(3,'SQL',69,'Semester'),
(4,'Computer Network',95,'Semester');

SELECT*FROM Marks;

SELECT*FROM Student;
SELECT*FROM Marks
WHERE marks>80;

SELECT*FROM student
WHERE student_name='Addy';

DESCRIBE Student;

SELECT*FROM student
WHERE name='Addy';

SELECT*FROM Student 
WHERE course='BCA';

SELECT*FROM Student 
WHERE age>18;

SELECT*FROM Student 
ORDER BY age DESC;

SELECT AVG(age) AS average_age
FROM Student;

SELECT COUNT(*) AS total_students
FROM Student;

SELECT MAX(age) AS maximum_age
FROM Student;


SELECT MIN(age) AS minimum_age
FROM Student;

SELECT course, COUNT(*) AS total_student
FROM student 
GROUP BY course;


SELECT course, COUNT(*) AS total_student FROM student 
GROUP BY course
HAVING COUNT(*)>1;

SELECT *FROM Student 
WHERE name LIKE 'A%';

SELECT*FROM Student 
WHERE course IN('BCA','BBA');

SELECT*FROM Marks
WHERE marks IN (85,95);
 
SELECT Student.name,Marks.subject, Marks.marks
FROM Student 
INNER JOIN Marks ON Student.student_id=Marks.student_id;

SELECT Student.name,Marks.subject,Marks.marks FROM Student
LEFT JOIN Marks ON Student.student_id=Marks.student_id;

SELECT Student.name, Marks.subject,Marks.marks FROM Student
RIGHT JOIN Marks ON Student.student_id=Marks.student_id;

SELECT Student.name FROM Student 
LEFT JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.student_id IS NULL;

SELECT Student.name,Marks.subject FROM student
INNER JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.marks>80;

SELECT Student.name,Marks.subject FROM student 
INNER JOIN Marks ON Student.student_id=Marks.student_id
ORDER BY Marks.marks DESC;

USE StudentManagement;

SELECT Student.name,AVG(Marks.marks) AS average_marks FROM Student 
INNER JOIN Marks ON Student.student_id=Marks.student_id
GROUP BY Student.student_id,student.name;

SELECT Student.name,Marks.subject,Marks.marks,E.course_id FROM Student 
INNER JOIN Marks ON Student.student_id=Marks.student_id
INNER JOIN Enrollment AS E ON Student.student_id= E.student_id;

DESCRIBE Enrollment;

SELECT Student.name,E.course_id,E.enrollment_date FROM Student 
INNER JOIN Enrollment AS E ON Student.student_id=E.student_id;

SELECT Student.name,Marks.subject,Marks.marks FROM student
INNER JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.marks BETWEEN 70 and 90;

SELECT Student.name,Marks.subject,Marks.marks FROM Student 
INNER JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.marks IN (85,95);

USE StudentManagement;

SELECT AVG(marks) FROM Marks;
SELECT Student.name, Marks.marks FROM student
INNER JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.marks > (
SELECT AVG(Marks.marks) FROM Marks
);
SELECT Student.name,Marks.subject,Marks.marks FROM student
INNER JOIN Marks ON Student.student_id= Marks.student_id
WHERE Marks.marks > (
SELECT MAX(Marks.marks) FROM Marks
);

SELECT Student.name,Marks.subject,Marks.marks FROM student
INNER JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.marks> (
SELECT MIN(Marks.marks) FROM Marks
);

SELECT Student.name,Marks.marks FROM student 
INNER JOIN Marks ON Student.student_id=Marks.student_id
WHERE Marks.marks > (
SELECT Marks.marks FROM Marks
WHERE Marks.student_id=1
);

SELECT Student.name FROM Student 
WHERE Student.student_id IN (
SELECT Marks.student_id FROM Marks
);

SELECT Student.name FROM Student 
WHERE EXISTS(
SELECT 1 FROM Marks WHERE Marks.student_id=Student.student_id
);
USE StudentManagement;

SELECT* FROM Student;
SELECT*FROM Teacher;
SELECT*FROM Course;
SELECT*FROM Enrollment;

UPDATE Student
SET name= 'Aradhya'
WHERE Student_id=4;

SELECT*FROM Student 
WHERE Student_id=4;

UPDATE Marks
SET Marks=92
WHERE student_id=1;

DELETE FROM Marks
WHERE Student_id='2';

DESCRIBE Student;
DESCRIBE Teacher;
DESCRIBE Course;
DESCRIBE Marks;

SHOW CREATE TABLE Student;
SHOW CREATE TABLE Marks;
SHOW CREATE TABLE Teacher;

SELECT*FROM Student;
SELECT*FROM Teacher;
SELECT*FROM Course;



SELECT 
    Student.student_id,
    Student.name,
    Course.course_name,
    Marks.subject,
    Marks.marks
FROM Student
INNER JOIN Enrollment
    ON Student.student_id = Enrollment.student_id
INNER JOIN Course
    ON Enrollment.course_id = Course.course_id
INNER JOIN Marks
    ON Student.student_id = Marks.student_id;

SELECT 
    Student.name,
    AVG(Marks.marks) AS average_marks,
    MAX(Marks.marks) AS highest_marks,
    MIN(Marks.marks) AS lowest_marks
FROM Student
INNER JOIN Marks
    ON Student.student_id = Marks.student_id
GROUP BY Student.student_id, Student.name;


