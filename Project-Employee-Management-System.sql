/*Step 1: Database Design*/

/*Create a Database*/
CREATE TABLE EmployeeManagement;
USE EmployeeManagement;

/*Create Tables with Constraints*/
CREATE TABLE departments 
(departmentId INT PRIMARY KEY NOT NULL,
departmentName VARCHAR(100) NOT NULL);

CREATE TABLE employees 
(employeeId INT PRIMARY KEY NOT NULL,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
age INT NOT NULL,
email VARCHAR(100) NOT NULL,
departmentId INT NOT NULL,
FOREIGN KEY (departmentId) REFERENCES departments (departmentId));

CREATE TABLE projects 
(projectId INT PRIMARY KEY NOT NULL,
projectName VARCHAR(100) NOT NULL,
projectBudget DECIMAL(10,0) NOT NULL,
managerId INT NOT NULL,
FOREIGN KEY (managerId) REFERENCES employees (employeeId));

/*Step 2: Data Manipulation and Retrieval*/

/*Insert Sample Data*/
INSERT INTO departments (departmentId, departmentName) VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing');

INSERT INTO employees (employeeId, firstName, lastName, age, email, departmentId) VALUES
(1, 'Caesar', 'Ortiz', 26, 'cgo1998@gmail.com', 2),
(2, 'Allison', 'Garcia', 28, 'all2828@gmail.com', 2),
(3, 'Amelia', 'Miller', 30, 'ammiller@gmail.com', 3),
(4, 'Peter', 'Taylor', 25, 'petertlor@gmail.com', 3),
(5, 'Ava', 'Jones', 28, 'avaavajones@gmail.com', 1);

INSERT INTO projects (projectId, projectName, projectBudget, managerId) VALUES
(1, 'Mobile Application Development', 10000, 1),
(2, 'Website Redesign', 5000, 2),
(3, 'Interactive Marketing Campaign', 20000, 3);

/*Retrieve Employee Information*/
SELECT a.employeeId, a.firstName, a.lastName, a.age, a.email, b.departmentName 
FROM employees a
INNER JOIN departments b
ON a.departmentId = b.departmentId;

/*Project and Manager Information*/
SELECT a.projectId, a.projectName, a.projectBudget, 
b.firstName AS managerFirstName, b.lastName AS managerLastName
FROM projects a
INNER JOIN employees b
ON a.managerId = b.employeeId;

/*Filter Data Using WHERE*/
SELECT * FROM employees WHERE age > 40 AND departmentId = 2;

/*Employee Details View*/
CREATE VIEW EmployeeDetails AS
SELECT a.employeeId, a.firstName, a.lastName, b.departmentName
FROM employees a
INNER JOIN departments b
ON a.departmentId = b.departmentId;

/*Active Projects View*/
CREATE VIEW ActiveProjects AS
SELECT projectName, projectBudget, managerId
FROM projects
WHERE projectBudget > 1000;