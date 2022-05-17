-- https://leetcode.com/discuss/general-discussion/1208129/list-of-free-leetcode-sql-questions

-- Q1 - https://leetcode.com/problems/big-countries/
SELECT name, population, area
FROM World
WHERE area >= 3000000
OR population >= 25000000;


-- Q2 - https://leetcode.com/problems/swap-salary/submissions/
UPDATE Salary  
SET sex = CASE sex  
WHEN 'm' THEN 'f'  
WHEN 'f' THEN 'm'  
ELSE NULL  
END; 

-- Q3 - https://leetcode.com/problems/not-boring-movies/
SELECT *
FROM Cinema
WHERE id % 2 != 0
AND description NOT LIKE '%boring%'
ORDER BY rating DESC;

-- Q4 - https://leetcode.com/problems/duplicate-emails/
SELECT DISTINCT email
FROM Person a
WHERE id != (
    SELECT MAX(id) from Person b WHERE a.email = b.email
);

-- Q5 - https://leetcode.com/problems/combine-two-tables/submissions/
SELECT firstName, lastName, city, state
FROM Person
LEFT JOIN Address on Person.personId = Address.personId;

-- Q6 - https://leetcode.com/problems/employees-earning-more-than-their-managers
SELECT e.name as Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;

-- Q7 - https://leetcode.com/problems/customers-who-never-order/
SELECT name AS Customers
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE Orders.id IS NULL;

-- Q8 - https://leetcode.com/problems/delete-duplicate-emails/
DELETE p1
FROM Person p1 JOIN Person p2
ON p1.email = p2.email WHERE p1.id > p2.id;

-- Q9 - https://leetcode.com/problems/rising-temperature
SELECT w1.id as id
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
AND w1.temperature > w2.temperature;

-- Q10 - https://leetcode.com/problems/classes-more-than-5-students/
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;

-- Q11 - https://leetcode.com/problems/second-highest-salary/
SELECT
(SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1,1)
 AS SecondHighestSalary;
 
 -- Q12 - https://leetcode.com/problems/game-play-analysis-i/
 SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id;

-- Q13 - https://leetcode.com/problems/sales-person/
SELECT sp.name
FROM SalesPerson sp
WHERE sp.name NOT IN (
    SELECT sp.name
    FROM Orders o
    RIGHT OUTER JOIN SalesPerson sp ON o.sales_id = sp.sales_id
    WHERE o.com_id = (
        SELECT com_id from Company where name='RED'
    )
);

-- Q14 - https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING count(*) >= 3;

-- Q15 - https://leetcode.com/problems/sales-analysis-iii/
SELECT p.product_id, p.product_name
FROM Product p
WHERE (product_id, product_name) NOT IN (
    SELECT p.product_id, p.product_name
    FROM Sales s
    JOIN Product p ON p.product_id = s.product_id
    WHERE s.sale_date < '2019-01-01' OR s.sale_date >  '2019-03-31'
);

-- Q15 - https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

