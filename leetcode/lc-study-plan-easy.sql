-- Q - https://leetcode.com/problems/find-customer-referee/submissions/
select name from Customer where referee_id != 2 OR referee_id IS NULL;
