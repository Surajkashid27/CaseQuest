#How many orders were shipped but later canceled
SELECT COUNT(*) AS CanceledOrders
FROM sale_report 
WHERE Status = 'Cancelled' AND Fulfilment = 'Shipped';

# the total revenue generated from orders shipped via Amazon's expedited shipping
SELECT SUM(Amount) AS TotalRevenue
FROM sale_report
WHERE `ship-service-level` = 'Expedited' AND Status = 'Shipped';

# Which city had the highest number of orders shipped
SELECT `ship-city`, COUNT(*) AS NumberOfOrders
FROM sale_report
WHERE Status = 'Shipped'
GROUP BY `ship-city`
ORDER BY NumberOfOrders DESC
LIMIT 5;

# What is the average amount of orders shipped to Maharashtra
SELECT AVG(Amount) AS AverageOrderAmount
FROM sale_report
WHERE `ship-state` = 'MAHARASHTRA' AND Status = 'Shipped';

#What is the most frequently ordered product category
Select Category, count(*) as NumberOfOrders
FROM sale_report
group by Category
order by NumberOfOrders desc
limit 1;

#How many unique SKUs were sold
Select count(distinct(SKU)) AS UniqueSKU
FROM sale_report
where Status = 'shipped';

# Which fulfillment channel had the highest number of canceled orders
SELECT Fulfilment, COUNT(*) as CancelledOrders
FROM sale_report
where Status = 'Cancelled'
group by Fulfilment
order by CancelledOrders desc
limit 1;

#List of the top 5 cities by the total amount of revenue generated.
Select 'ship-city', sum(Amount) as TotalRevenue
FROM sale_report
where Status = 'Shipped'
group by 'ship-city'
order by TotalRevenue desc
limit 5;

SELECT `ship-city`, SUM(Amount) AS TotalRevenue
FROM sale_report
WHERE Status = 'Shipped'
GROUP BY `ship-city`
ORDER BY TotalRevenue DESC
LIMIT 5;



