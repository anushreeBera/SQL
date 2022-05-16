-- https://leetcode.com/discuss/general-discussion/1208129/list-of-free-leetcode-sql-questions

-- Q1 - https://leetcode.com/problems/swap-salary/submissions/
UPDATE Salary  
SET sex = CASE sex  
WHEN 'm' THEN 'f'  
WHEN 'f' THEN 'm'  
ELSE NULL  
END; 

