# Employee Attendance & Leave Management System (SQL)

## About the Project
This project is a **SQL-based database system** developed to manage employee details,
daily attendance records, and leave information.

The main objective of this project is to practice **core DBMS concepts** such as
table design, relationships, joins, aggregation, and conditional logic using SQL.
It also generates a **monthly attendance summary** to evaluate employee performance.

This project was created as part of **BCA internship preparation**.

## Tools and Technologies Used
- **SQL (MySQL)**
- **SQLite (Online SQL Compiler)**

## Database Design
The database consists of **three main tables** :

### Employees Table
Stores employee information such as **name, department, designation, joining date,
salary, and email**.

### Attendance Table
Stores **daily attendance records** including attendance date, status  
(Present, Absent, Late, Half Day), and working hours.

### Leave Details Table
Stores employee **leave information** including leave date, leave type,
and approval status.

A **SQL VIEW** is used to generate the monthly attendance summary.

## Project Features
- Manage employee details  
- Record daily attendance for multiple working days  
- Handle different attendance statuses  
- Store approved leave records  
- Generate monthly attendance summary  
- Classify employee performance as **Excellent**, **Good**, or **Needs Improvement**

## How to Run the Project

### Option 1: Run on Local Computer (MySQL)
1. Open **MySQL Command Line** or **MySQL Workbench**
2. Run the SQL file **employee_attendance_project.sql**
3. Execute SELECT queries or use the monthly attendance summary view

### Option 2: Run on Online SQL Compiler (SQLite)
1. Open any **SQLite Online SQL Compiler**
2. Run the SQL file **employee_attendance_sqlite.sql**
3. Execute the final SELECT statement to view the summary

## Database Versions
This project includes two SQL versions to support different execution environments:
- **MySQL Version** – for local execution on computer  
- **SQLite Version** – for online SQL compiler execution  

## Output
The project generates a **monthly attendance summary** that shows:
- Total working days  
- Number of present days  
- Late and half-day count  
- Average working hours  
- Performance rating  

## Project Type
- **Academic / Internship Project**
- **SQL / DBMS Project**
- Database-focused project with **no frontend or web application**

## Author
**Edwin Regi**
