-- Employee Attendance & Leave Management System
-- SQLite / Online Compiler Version

-- Drop tables if already exist
DROP TABLE IF EXISTS leave_details;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS employees;

-- Employees table
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY AUTOINCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    join_date DATE NOT NULL,
    salary DECIMAL(10,2),
    email VARCHAR(100) UNIQUE
);

-- Attendance table
CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    emp_id INTEGER NOT NULL,
    attendance_date DATE NOT NULL,
    status VARCHAR(10) DEFAULT 'Present'
        CHECK (status IN ('Present','Absent','Late','Half Day')),
    hours_worked DECIMAL(4,2),
    UNIQUE (emp_id, attendance_date)
);

-- Leave details table
CREATE TABLE leave_details (
    leave_id INTEGER PRIMARY KEY AUTOINCREMENT,
    emp_id INTEGER NOT NULL,
    leave_date DATE NOT NULL,
    leave_type VARCHAR(10) DEFAULT 'Casual'
        CHECK (leave_type IN ('Sick','Casual','Earned')),
    reason VARCHAR(200),
    status VARCHAR(10) DEFAULT 'Pending'
        CHECK (status IN ('Approved','Pending','Rejected'))
);

-- Insert employees
INSERT INTO employees (emp_name, department, designation, join_date, salary, email) VALUES
('Emerin Mandakan','IT','Developer','2023-01-15',45000,'emerin@company.com'),
('Edwin Regi','IT','Team Lead','2021-03-20',65000,'edwin@company.com'),
('Ebin Benny','HR','HR Executive','2022-06-10',35000,'ebin@company.com'),
('Bestho M Eldho','Finance','Accountant','2023-08-05',40000,'bestho@company.com'),
('Haizel James','Marketing','Manager','2022-11-12',55000,'haizel@company.com');

-- Attendance records (Employee 1)
INSERT INTO attendance VALUES
(NULL,1,'2026-02-01','Present',8),(NULL,1,'2026-02-02','Late',6),
(NULL,1,'2026-02-03','Present',8),(NULL,1,'2026-02-04','Present',8),
(NULL,1,'2026-02-05','Absent',0),(NULL,1,'2026-02-06','Present',8),
(NULL,1,'2026-02-07','Present',8),(NULL,1,'2026-02-08','Late',6),
(NULL,1,'2026-02-09','Present',8),(NULL,1,'2026-02-10','Present',8),
(NULL,1,'2026-02-11','Present',8),(NULL,1,'2026-02-12','Absent',0),
(NULL,1,'2026-02-13','Present',8),(NULL,1,'2026-02-14','Present',8),
(NULL,1,'2026-02-15','Present',8);

-- Attendance records (Employee 2)
INSERT INTO attendance VALUES
(NULL,2,'2026-02-01','Present',8),(NULL,2,'2026-02-02','Present',8),
(NULL,2,'2026-02-03','Present',8),(NULL,2,'2026-02-04','Present',8),
(NULL,2,'2026-02-05','Present',8),(NULL,2,'2026-02-06','Present',8),
(NULL,2,'2026-02-07','Present',8),(NULL,2,'2026-02-08','Present',8),
(NULL,2,'2026-02-09','Present',8),(NULL,2,'2026-02-10','Present',8),
(NULL,2,'2026-02-11','Present',8),(NULL,2,'2026-02-12','Present',8),
(NULL,2,'2026-02-13','Present',8),(NULL,2,'2026-02-14','Present',8),
(NULL,2,'2026-02-15','Present',8);

-- Attendance records (Employee 3)
INSERT INTO attendance VALUES
(NULL,3,'2026-02-01','Present',7),(NULL,3,'2026-02-02','Absent',0),
(NULL,3,'2026-02-03','Late',6),(NULL,3,'2026-02-04','Present',7),
(NULL,3,'2026-02-05','Absent',0),(NULL,3,'2026-02-06','Present',7),
(NULL,3,'2026-02-07','Absent',0),(NULL,3,'2026-02-08','Present',7),
(NULL,3,'2026-02-09','Absent',0),(NULL,3,'2026-02-10','Late',6),
(NULL,3,'2026-02-11','Present',7),(NULL,3,'2026-02-12','Absent',0),
(NULL,3,'2026-02-13','Present',7),(NULL,3,'2026-02-14','Absent',0),
(NULL,3,'2026-02-15','Present',7);

-- Attendance records (Employee 4)
INSERT INTO attendance VALUES
(NULL,4,'2026-02-01','Present',7),(NULL,4,'2026-02-02','Half Day',4),
(NULL,4,'2026-02-03','Absent',0),(NULL,4,'2026-02-04','Present',7),
(NULL,4,'2026-02-05','Present',7),(NULL,4,'2026-02-06','Absent',0),
(NULL,4,'2026-02-07','Present',7),(NULL,4,'2026-02-08','Absent',0),
(NULL,4,'2026-02-09','Present',7),(NULL,4,'2026-02-10','Present',7),
(NULL,4,'2026-02-11','Absent',0),(NULL,4,'2026-02-12','Present',7),
(NULL,4,'2026-02-13','Absent',0),(NULL,4,'2026-02-14','Present',7),
(NULL,4,'2026-02-15','Present',7);

-- Attendance records (Employee 5)
INSERT INTO attendance VALUES
(NULL,5,'2026-02-01','Late',6),(NULL,5,'2026-02-02','Present',8),
(NULL,5,'2026-02-03','Present',8),(NULL,5,'2026-02-04','Absent',0),
(NULL,5,'2026-02-05','Present',8),(NULL,5,'2026-02-06','Present',8),
(NULL,5,'2026-02-07','Late',6),(NULL,5,'2026-02-08','Present',8),
(NULL,5,'2026-02-09','Present',8),(NULL,5,'2026-02-10','Absent',0),
(NULL,5,'2026-02-11','Present',8),(NULL,5,'2026-02-12','Present',8),
(NULL,5,'2026-02-13','Present',8),(NULL,5,'2026-02-14','Present',8),
(NULL,5,'2026-02-15','Present',8);

-- Leave records
INSERT INTO leave_details VALUES
(NULL,3,'2026-02-05','Casual','Personal','Approved'),
(NULL,4,'2026-02-03','Sick','Fever','Approved'),
(NULL,5,'2026-02-04','Casual','Vacation','Approved');

-- Monthly summary view
DROP VIEW IF EXISTS monthly_attendance_summary;

CREATE VIEW monthly_attendance_summary AS
SELECT 
    e.emp_name,
    e.department,
    COUNT(a.attendance_id) AS total_days,
    SUM(CASE WHEN a.status='Present' THEN 1 ELSE 0 END) AS present_days,
    SUM(CASE WHEN a.status='Late' THEN 1 ELSE 0 END) AS late_days,
    SUM(CASE WHEN a.status='Half Day' THEN 1 ELSE 0 END) AS half_days,
    ROUND(AVG(a.hours_worked),1) AS avg_hours,
    COUNT(l.leave_id) AS approved_leaves,
    CASE
        WHEN e.department='IT'
             AND SUM(CASE WHEN a.status='Present' THEN 1 ELSE 0 END) >= 12
             THEN 'Excellent'
        WHEN SUM(CASE WHEN a.status='Present' THEN 1 ELSE 0 END) >= 8
             THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance_rating
FROM employees e
LEFT JOIN attendance a ON e.emp_id = a.emp_id
LEFT JOIN leave_details l ON e.emp_id = l.emp_id AND l.status='Approved'
WHERE strftime('%m', a.attendance_date)='02'
  AND strftime('%Y', a.attendance_date)='2026'
GROUP BY e.emp_id, e.emp_name, e.department;

-- Final output
SELECT * FROM monthly_attendance_summary;
