-- 1NF: Original table
CREATE TABLE Student_1NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseName VARCHAR(50),
    FacultyName VARCHAR(50),
    DepartmentName VARCHAR(50)
);

-- 2NF: Separate entities to remove partial dependencies

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Enrollment table connects Student and Course
CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- 3NF:
-- Student → StudentName
-- Course → CourseName, FacultyID
-- Faculty → FacultyName, DepartmentID
-- Department → DepartmentName
