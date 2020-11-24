--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal ON 
emp.emp_no=sal.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year',hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dep.dept_no, dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM departments AS dep
INNER JOIN dept_manager AS man ON
dep.dept_no=man.dept_no
INNER JOIN employees AS emp ON
man.emp_no=emp.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees AS emp
INNER JOIN dept_manager AS man ON
emp.emp_no=man.emp_no
INNER JOIN departments AS dep ON
dep.dept_no=man.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM departments AS dep 
INNER JOIN dept_emp AS de ON
de.dept_no=dep.dept_no
INNER JOIN employees AS emp ON
emp.emp_no=de.emp_no
WHERE dep.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM departments AS dep 
INNER JOIN dept_emp AS de ON
de.dept_no=dep.dept_no
INNER JOIN employees AS emp ON
emp.emp_no=de.emp_no
WHERE dep.dept_name = 'Sales' OR dep.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name)
FROM employees
GROUP BY last_name ORDER BY COUNT(last_name) DESC;


--As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to 
--test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with 
--which you will confront your boss:

-- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:

--    ```sql
--    from sqlalchemy import create_engine
--    engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--    connection = engine.connect()
--    ```

* Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

* If using a password, do not upload your password to your GitHub repository. See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and [https://help.github.com/en/github/using-git/ignoring-files](https://help.github.com/en/github/using-git/ignoring-files) for more information.

2. Create a histogram to visualize the most common salary ranges for employees.

3. Create a bar chart of average salary by title.
