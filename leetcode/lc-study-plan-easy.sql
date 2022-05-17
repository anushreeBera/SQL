-- Q - https://leetcode.com/problems/find-customer-referee/submissions/
select name from Customer where referee_id != 2 OR referee_id IS NULL;

-- Q - https://leetcode.com/problems/recyclable-and-low-fat-products/
select product_id from products where low_fats = 'Y' and recyclable='Y';
