-- Data Engineering --
-- drop TABLE if exists
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- Import CSV Files Into Corresponding SQL Table
-- create table departments
CREATE TABLE departments (
    dept_no varchar(20) not null,
    dept_name varchar(100) not null,
    PRIMARY KEY (dept_no)
);

-- create table titles
CREATE TABLE titles (
    title_id varchar(30) not null,
    title varchar(100) not null,
    PRIMARY KEY (title_id)
);

-- create table employees
CREATE TABLE employees (
    emp_no int not null,
    emp_title_id varchar(30) not null,
    birth_date date not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    sex varchar(10) not null,
    hire_date date not null,
    PRIMARY KEY (emp_no),
    CONSTRAINT fk_titles
        FOREIGN KEY (emp_title_id)
        REFERENCES titles(title_id)
);

-- create table dept_manager
CREATE TABLE dept_manager (
    dept_no varchar(20) not null,
    emp_no int not null,
    PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_departments
        FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no),
    CONSTRAINT fk_employees
        FOREIGN KEY (emp_no)
        REFERENCES employees(emp_no)
);

-- create table dept_emp
CREATE TABLE dept_emp (
    emp_no int not null,
    dept_no varchar(20) not null,
    PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_emp
        FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no),
    CONSTRAINT fk_dept_departments
        FOREIGN KEY (dept_no)
        REFERENCES departments(dept_no)
);

-- create table salaries
CREATE TABLE salaries (
    emp_no int not null,
    salary numeric(10,2) not null,
    PRIMARY KEY (emp_no),
    CONSTRAINT fk_emp_salaries
        FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);
-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
