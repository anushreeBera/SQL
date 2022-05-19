-- Q - https://leetcode.com/problems/find-customer-referee/submissions/
select name from Customer where referee_id != 2 OR referee_id IS NULL;

-- Q - https://leetcode.com/problems/recyclable-and-low-fat-products/
select product_id from products where low_fats = 'Y' and recyclable='Y';

-- Q - https://leetcode.com/problems/calculate-special-bonus
select employee_id, CASE
WHEN employee_id % 2 != 0 and name not like 'M%' THEN salary
ELSE 0
END as bonus
from Employees

-- Q - https://leetcode.com/problems/the-latest-login-in-2020/
select user_id, MAX(time_stamp) as last_stamp
from Logins
where date_format(time_stamp, "%Y") = 2020
GROUP BY user_id

-- Q - https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
select customer_number
from Orders
GROUP BY customer_number
order by count(*) desc
LIMIT 1
