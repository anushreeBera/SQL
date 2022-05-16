-- Employee | Department --
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Schema --
create table department(  
  id        INT(10),  
  name      varchar(14),  
  location  varchar(13),  
  constraint pk_id primary key (id)  
);

create table employee (
  id INT(10),
  name VARCHAR(255),
  salary INT(10),
  department_id INT(10),
  constraint pk_id primary key (id),
  CONSTRAINT fk_deptno FOREIGN KEY (department_id)
    REFERENCES department(id) 
);
  
  INSERT INTo department(id, name, location)
VALUES (1, 'plumber', 'JSR'),
(2, 'Carpenter', 'HYD'),
(3, 'Mason', 'NYC');

  INSERT INTO employee (id, name, salary, department_id)
  VALUES (1, 'anu', 10, 1), (2, 'babai', 20, 2), (3, 'catie', 40, 3), (4, 'dochie', 25, 1), (5, 'elen', 47, 2);


--Q1 - SQL Query to find the second highest salary of Employee
select * from employee order by salary DESC LIMIT 1,1;

--Q2 - a- SQL Query to find Max Salary from each department.
select department_id, max(salary)
from employee 
group by department_id;

-- b- SQL Query to find Max Salary from each department with department name.
select department.name, max(salary)
from employee right outer join department on department.id=employee.department_id
group by department_id;

-- Q3 - a- Write SQL Query to find duplicate rows in a database? and then write SQL query to delete them?
SELECT * FROM employee a WHERE id != (SELECT MAX(id) FROM employee b WHERE a.name=b.name);

DELETE FROM employee a WHERE id != (SELECT MAX(id) FROM employee b WHERE a.name=b.name);

-- Q4 - Display above average salary employees
SELECT *
FROM employee
WHERE salary >= ( SELECT AVG(salary) FROM employee);

-- Q5 - Find all employees who are also managers
SELECT DISTINCT(m.name) FROM employee e, employee m WHERE e.manager_id = m.id;
