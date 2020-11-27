# SQL Homework - Employee Database: A Mystery in Two Parts


## Background

Conduct a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

Design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, perform the following:

Data Modeling
Data Engineering
Data Analysis

#### Data Modeling

Inspect the CSVs and sketch out an ERD of the tables. Feel free to use a tool like [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

#### Data Engineering
Use the information to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
Import each CSV file into the corresponding SQL table.

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

* Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

  * For the primary keys check to see if the column is unique, otherwise create a [composite key](https://en.wikipedia.org/wiki/Compound_key). Which takes to primary keys in order to uniquely identify a row.
  * Be sure to create tables in the correct order to handle foreign keys.

* Import each CSV file into the corresponding SQL table. **Note** be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors.

#### Data Analysis

Once you have a complete database, do the following:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

## Bonus (Optional)

As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   ```

* Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

* If using a password, do not upload your password to your GitHub repository. See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and [https://help.github.com/en/github/using-git/ignoring-files](https://help.github.com/en/github/using-git/ignoring-files) for more information.

2. Create a histogram to visualize the most common salary ranges for employees.

3. Create a bar chart of average salary by title.

## Epilogue

Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

## Submission

* Create an image file of your ERD.

* Create a `.sql` file of your table schemata.

* Create a `.sql` file of your queries.

* (Optional) Create a Jupyter Notebook of the bonus analysis.

* Create and upload a repository with the above files to GitHub and post a link on BootCamp Spot.

* Ensure your repository has regular commits (i.e. 20+ commits) and a thorough README.md file

### Copyright

Trilogy Education Services © 2019. All Rights Reserved.
