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

-- Q5 - 
