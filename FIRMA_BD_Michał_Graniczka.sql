-- MICHAŁ GRANICZKA
-- BAZA DANYCH FIRMA
-- ZADANIE Z WYKŁADU 5

-- Kod służący do usunięcia tabel || odkomentować gdy potrzebne
/*DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;
DROP TABLE projects CASCADE CONSTRAINTS;
DROP TABLE works CASCADE CONSTRAINTS;
DROP TABLE localizations CASCADE CONSTRAINTS;
DROP TABLE family CASCADE CONSTRAINTS;*/

-- Kod służący do utworzenia tabel
CREATE TABLE employees(
pesel NUMBER(11) PRIMARY KEY,
first_name VARCHAR(30),
second_name VARCHAR(30),
last_name VARCHAR(30),
birth_date DATE,
sex CHAR(1) CHECK (sex IN ('M','W')),
adress VARCHAR(150),
salary CHAR(6),
dept_id NUMBER(11),
dept_name VARCHAR(50),
manager_pesel NUMBER(11));

CREATE TABLE departments(
name VARCHAR(50),
id NUMBER(11),
localization_id NUMBER(11),
localization_name VARCHAR(30),
amount_of_emp NUMBER(11),
manager_pesel NUMBER(11),
manager_since DATE,
PRIMARY KEY (name,id));

CREATE TABLE projects(
name VARCHAR(30),
id NUMBER(11),
localization NUMBER(11),
dept_id NUMBER(11),
dept_name VARCHAR(50),
PRIMARY KEY (name,id));

CREATE TABLE works(
emp_pesel NUMBER(11),
project_id NUMBER(11),
project_name VARCHAR(30),
hours VARCHAR(8),
PRIMARY KEY (emp_pesel,project_id));

CREATE TABLE localizations(
id NUMBER(11),
name VARCHAR(30),
PRIMARY KEY (id,name));

CREATE TABLE family(
emp_pesel NUMBER(11),
first_name VARCHAR(30) PRIMARY KEY,
sex CHAR(1) CHECK (sex IN ('M','W')),
birth_date DATE,
deg_of_rel VARCHAR(30));

-- Kod służący do dodania do tabel kluczów obcych
ALTER TABLE employees
ADD FOREIGN KEY (dept_name,dept_id) REFERENCES departments(name,id);
ALTER TABLE employees
ADD FOREIGN KEY (manager_pesel) REFERENCES employees(pesel);
ALTER TABLE departments
ADD FOREIGN KEY (localization_id,localization_name) REFERENCES localizations(id,name);
ALTER TABLE departments
ADD FOREIGN KEY (manager_pesel) REFERENCES employees(pesel);
ALTER TABLE projects
ADD FOREIGN KEY (dept_name,dept_id) REFERENCES departments(name,id);
ALTER TABLE works
ADD FOREIGN KEY (emp_pesel) REFERENCES employees(pesel);
ALTER TABLE works
ADD FOREIGN KEY (project_name,project_id) REFERENCES projects(name,id);
ALTER TABLE family
ADD FOREIGN KEY (emp_pesel) REFERENCES employees(pesel);