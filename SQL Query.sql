select * from cleaned_sales_data;

--1. Total Sales by Region
--Write a query to calculate the total sales_amount for each region.

select region, sum(sales_amount) as total_sales from cleaned_sales_data
group by region;


--2. Top 5 Products by Sales
--Find the top 5 product_id based on total sales_amount.

select top 5 product_id,sum(sales_amount) as total_sales from cleaned_sales_data 
group by product_id
order by sum(sales_amount) desc;

--3. Sales by Each Sales Representative
--Display total sales_amount handled by each sales_rep, sorted from highest to lowest.
select sales_rep, sum(sales_amount) as total_sales from cleaned_sales_data
group by sales_rep
order by sum(sales_amount) desc;

--4. Average Discount by Customer Type
--Find the average discount given to each customer_type.
select customer_type,avg(discount) as avg_discount from cleaned_sales_data
group by customer_type;

--5. Monthly Sales Trend
--Extract year and month from sale_date and calculate total sales_amount per month.
SELECT 
    DATEPART(YEAR, TRY_CONVERT(DATE, sale_date)) AS year,
    DATEPART(MONTH, TRY_CONVERT(DATE, sale_date)) AS month,
    SUM(sales_amount) AS total_sales
FROM cleaned_sales_data
WHERE TRY_CONVERT(DATE, sale_date) IS NOT NULL
GROUP BY 
    DATEPART(YEAR, TRY_CONVERT(DATE, sale_date)),
    DATEPART(MONTH, TRY_CONVERT(DATE, sale_date))
ORDER BY year, month;

--6. Most Sold Product Category
--Find the product_category with the highest total quantity_sold.
select
product_category,sum(quantity_sold) as total_qty 
from cleaned_sales_data
group by product_category
order by total_qty desc;


--7. Profit Calculation
--Calculate profit per transaction using:
--profit = (unit_price - unit_cost) * quantity_sold
--Then display all columns with the profit.

select product_id,unit_price,unit_cost,quantity_sold,
(unit_price - unit_cost) * quantity_sold as profit from cleaned_sales_data
order by profit desc;

--8. High Value Transactions
--Retrieve all records where sales_amount > 9,000 and discount < 10%.

select sales_amount,discount from cleaned_sales_data
where sales_amount > 9000 and discount < 0.1;

--9. Payment Method Analysis
--Find total sales_amount grouped by payment_method.

select payment_method,sum(sales_amount) as total_sales from cleaned_sales_data
group by payment_method;

--10. Best Performing Region & Sales Rep Combination
--Using region_and_sales_rep, find the combination with the highest total sales_amount.

select region,sales_rep,sum(sales_amount) as total_sales from cleaned_sales_data
group by region,sales_rep
order by total_sales desc;






