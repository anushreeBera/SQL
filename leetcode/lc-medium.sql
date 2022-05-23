-- Q1 - https://leetcode.com/problems/department-highest-salary/
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN Department d ON d.id = e.departmentId
WHERE (DepartmentId , salary) IN (
    SELECT DepartmentId, MAX(salary)
    FROM Employee
    GROUP BY DepartmentId
);

-- Q2 - https://leetcode.com/problems/nth-highest-salary/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N=N-1;
  RETURN (
      SELECT DISTINCT SALARY
        FROM EMPLOYEE
        ORDER BY SALARY DESC
        LIMIT N,1  
  );
END
