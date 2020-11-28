quickdbd url https://app.quickdatabasediagrams.com/#/

-- Q1 List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
from employees
join salaries 
on employees.emp_no = salaries.emp_no;

-- Q2 List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees 
where hire_date between '1986-01-01' and '1987-01-01';

-- Q3 List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

SELECT departments.dept_no, 
departments.dept_name, 
dept_manager.emp_no, 
employees.last_name, 
employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- Q4 List the department of each employee with the following information: employee number, 
--last name, first name, and department name.

SELECT dept_emp.emp_no,
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--Q5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Q6 List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Q7 List all employees in the Sales and Development departments, including their employee number, last name, first name,
--and department name.

SELECT dept_emp.emp_no,
employees.last_name,
employees.first_name, 
departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- Q8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
