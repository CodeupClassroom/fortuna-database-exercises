USE employees;
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 40;

SELECT first_name, last_name, s.salary
FROM employees
JOIN salaries s ON employees.emp_no = s.emp_no
WHERE s.salary > 55000
AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC;