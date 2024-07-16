<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ClassAttendanceBook.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Class Attendance Book</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Class Attendance Book</h2>
            <ul>
                <li><a href="Groups.aspx">Manage Groups</a></li>
                <li><a href="Students.aspx">Manage Students</a></li>
                <li><a href="Subjects.aspx">Manage Subjects</a></li>
                <li><a href="Attendance.aspx">Manage Attendance</a></li>
            </ul>
        </div>
    </form>
</body>
</html>

<%-- CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Groups (
    GroupID INT PRIMARY KEY IDENTITY,
    GroupName NVARCHAR(50) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    GroupID INT FOREIGN KEY REFERENCES Groups(GroupID)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY IDENTITY,
    SubjectName NVARCHAR(50) NOT NULL
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    AttendanceDate DATE NOT NULL,
    IsPresent BIT NOT NULL
);
 --%>
