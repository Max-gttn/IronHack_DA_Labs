USE publications;
select * FROM sales;

#Calculate the royalty of each sale for each author and the advance for each author and publication.

SELECT t.title_id,
		ta.au_id, 
        t.advance * ta.royaltyper / 100 as advance,
        t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalties
FROM titles t
	LEFT JOIN titleauthor ta
		ON t.title_id = ta.title_id
	LEFT JOIN sales s 
		ON s.title_id = t.title_id;

#Step 2: Aggregate the total royalties for each title and author
SELECT * FROM titleauthor order by 2;


SELECT t.title_id as title_id,
		ta.au_id as author_id, 
        SUM(t.advance * ta.royaltyper / 100) as advance,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalties
FROM titles t
	LEFT JOIN titleauthor ta
		ON t.title_id = ta.title_id
	LEFT JOIN sales s 
		ON s.title_id = t.title_id
GROUP BY title_id, author_id;

# Step 3: Calculate the total profits of each author
WITH step2 AS (
SELECT t.title_id as title_id,
		ta.au_id as author_id, 
        SUM(t.advance * ta.royaltyper / 100) as advance,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalties
FROM titles t
	LEFT JOIN titleauthor ta
		ON t.title_id = ta.title_id
	LEFT JOIN sales s 
		ON s.title_id = t.title_id
GROUP BY title_id, author_id
)
SELECT author_id, SUM(advance) + SUM(sales_royalties) as profit
FROM step2
GROUP BY author_id
ORDER BY profit DESC
LIMIT 3;

# Challenge 3
CREATE TEMPORARY TABLE temp_author_profits
SELECT author_id, SUM(advance) + SUM(sales_royalties) as profit
FROM (
SELECT t.title_id as title_id,
		ta.au_id as author_id, 
        SUM(t.advance * ta.royaltyper / 100) as advance,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalties
FROM titles t
	LEFT JOIN titleauthor ta
		ON t.title_id = ta.title_id
	LEFT JOIN sales s 
		ON s.title_id = t.title_id
GROUP BY title_id, author_id
) derived_table
GROUP BY author_id
ORDER BY profit DESC
LIMIT 3;

SELECT * FROM temp_author_profits;