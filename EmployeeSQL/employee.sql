-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary 
SELECT employees.emp_no, 
        employees.last_name, 
        employees.first_name, 
        employees.sex, 
        salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986; 
