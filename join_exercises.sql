USE join_test_db;

-- JOIN - guessing 7
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id

-- LEFT JOIN - guessing 10
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id

-- RIGHT JOIN - guessing 8
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id


-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
-- What is the reason behind the main FROM table? (answer to come)
USE employees;
SELECT dept.dept_name AS 'Department Name', CONCAT(drones.first_name, ' ', drones.last_name) AS 'Department Manager'
FROM employees AS drones
JOIN dept_manager AS dm
    ON drones.emp_no = dm.emp_no
JOIN departments AS dept
    ON dm.dept_no = dept.dept_no
WHERE dm.to_date > CURDATE()
ORDER BY dept.dept_name;

-- Find the name of all departments currently managed by women.
-- Explain why we are using the FROM
SELECT dept.dept_name AS 'Department Name', CONCAT(drones.first_name, ' ', drones.last_name) AS 'Department Manager'
FROM employees AS drones
JOIN dept_manager dm
    ON drones.emp_no = dm.emp_no
JOIN departments dept
    ON dm.dept_no = dept.dept_no
WHERE dm.to_date = '9999-01-01'
AND drones.gender = 'F'
ORDER BY dept.dept_name;

-- Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title AS 'Title', COUNT(titles.emp_no) AS 'COUNT'
FROM titles
  JOIN dept_emp
    ON titles.emp_no = dept_emp.emp_no
  JOIN departments
    ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date = '9999-01-01'
    AND departments.dept_name = 'Customer Service'
    AND dept_emp.to_date = '9999-01-01'
GROUP BY titles.title;

-- Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary
FROM employees e
         JOIN dept_manager dm
              ON dm.emp_no = e.emp_no
         JOIN salaries s
              ON s.emp_no = e.emp_no
         JOIN departments d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date >= CURDATE()
  AND s.to_date >= CURDATE()
ORDER BY d.dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT d.dept_name, mortals.first_name, mortals.last_name, mgmt.first_name, mgmt.last_name
FROM employees mortals
         JOIN dept_emp de
              ON mortals.emp_no = de.emp_no
         JOIN departments d
              ON de.dept_no = d.dept_no
         JOIN dept_manager manager
              ON d.dept_no = manager.dept_no
         JOIN employees mgmt
              ON manager.emp_no = mgmt.emp_no
WHERE de.to_date > curdate()
  AND manager.to_date > curdate()
ORDER BY d.dept_name;