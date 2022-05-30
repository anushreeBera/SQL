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

-- Q3 - https://leetcode.com/problems/capital-gainloss/
SELECT stock_name,
(SUM(CASE WHEN operation='Sell' THEN price ELSE 0 END) -
SUM(CASE WHEN operation='Buy' THEN price ELSE 0 END)) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name

-- Q4 - https://leetcode.com/problems/rank-scores/
SELECT score,
       dense_rank() over (ORDER BY score DESC) 'rank'
FROM Scores
;

-- Q5 - https://leetcode.com/problems/market-analysis-i/
select user_id as buyer_id, join_date, sum(if(year(order_date) = '2019', 1, 0)) as orders_in_2019
from users
left join orders on orders.buyer_id = users.user_id
group by user_id;
