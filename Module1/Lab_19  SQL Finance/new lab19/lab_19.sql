#1. From the order_items table, find the price of the highest priced order and lowest price order.
SELECT MAX(price), MIN(price)
FROM order_items;

#2. From the order_items table, what is range of the shipping_limit_date of the orders?
SELECT MIN(shipping_limit_date), MAX(shipping_limit_date) 
FROM order_items;

#3. From the customers table, find the states with the greatest number of customers. (SP)
SELECT customer_state, count(customer_id) as count_customers
FROM customers
GROUP BY customer_state
order by 2 DESC
LIMIT 10;

#4 From the customers table, within the state with the greatest number of customers, 
# find the cities with the greatest number of customers : Sao paulo
SELECT customer_city, count(customer_id) as count_customers
FROM customers
WHERE customer_state = 'SP'
GROUP BY customer_city
order by 2 DESC
LIMIT 10;

# 5. From the closed_deals table, how many distinct business segments are there (not including null)?
SELECT count(DISTINCT(business_segment))
FROM closed_deals
WHERE business_segment is not null;

# 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment
# and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
SELECT business_segment, sum(declared_monthly_revenue)
FROM closed_deals
WHERE business_segment is not null
GROUP BY business_segment
order by 2 DESC
LIMIT 3;

# 7. From the order_reviews table, find the total number of distinct review score values.: 5
SELECT COUNT(DISTINCT(review_score))
FROM order_reviews;

#8. In the order_reviews table, create a new column with a description that corresponds to each number category 
#for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
ALTER TABLE order_reviews
ADD COLUMN  description TEXT;

UPDATE order_reviews SET description = 'very bad review' WHERE review_score = 1;
UPDATE order_reviews SET description = 'bad review' WHERE review_score = 2;
UPDATE order_reviews SET description = 'average review' WHERE review_score = 3;
UPDATE order_reviews SET description = 'good review' WHERE review_score = 4;
UPDATE order_reviews SET description = 'very good review' WHERE review_score = 5;



#9 From the order_reviews table, find the review value occurring most frequently and how many times it occurs. : 5 with 57 420 reviews
SELECT review_score, count(review_score) as sum_review_score
FROM order_reviews
GROUP BY review_score
order by 2 DESC;
