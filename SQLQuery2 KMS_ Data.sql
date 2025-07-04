Create Database DSA_KultraKMS;

CREATE TABLE KMS_Data (
    [Order ID] VARCHAR(50),
    [Order Date] DATE,
    [Customer Name] VARCHAR(100),
    [Customer Segment] VARCHAR(50),
    [Region] VARCHAR(50),
    [Product Category] VARCHAR(100),
    [Product Sub-Category] VARCHAR(100),
    Sales FLOAT,
    Profit FLOAT,
    [Shipping Cost] FLOAT,
    [Ship Mode] VARCHAR(50),
    [Order Quantity] INT
);

select * from KMS_Data

------- 1. Product Category with the Highest Sales:----------

SELECT Product_category, SUM(Sales) as Total_Sales 
FROM KMS_Data
Group By Product_Category
Order by Total_Sales Desc;


-------- 2. Top 3 and Bottom 3 Regions in Sales -------------

SELECT Top 3 Region, Sum(Sales)as Total_Sales 
FROM KMS_Data
Group By Region
Order By Total_Sales Desc;

---2b. Bottom 3-------

SELECT top 3 Region, Sum(Sales)as Total_Sales 
FROM KMS_Data
Group By Region
Order By Total_Sales asc;


-------- 3. Total Sales of Appliances in Ontario: -------

SELECT SUM(Sales) AS Appliance_Sales
FROM KMS_Data
WHERE Product_Sub_Category = 'Appliances'
  AND Region = 'Ontario';

  -------------4. Total Sales of Appliances in Ontario:------------

SELECT Top 10 Customer_Name, Sum(Sales) as Total_Sales
From KMS_Data
Group By Customer_Name
Order By Total_Sales Asc;


  ------------5. Shipping Method with Highest Cost:---------

SELECT Ship_Mode, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM KMS_Data
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost DESC;


------------6. Most Valuable Customers:----------

SELECT TOP 5 Customer_Name, SUM(Sales) AS Total_Spent
FROM KMS_Data
GROUP BY Customer_Name
ORDER BY Total_Spent DESC;

----------7. Top Small Business Customer:

SELECT TOP 1 Customer_Name, SUM(Sales) AS Total_Sales
FROM KMS_Data
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

------------8. Corporate Customer with Most Orders:

SELECT TOP 1 Customer_Name, COUNT(Order_ID) AS Total_Orders
FROM KMS_Data
WHERE Customer_Segment = 'Corporate'
GROUP BY Customer_Name
ORDER BY Total_Orders DESC;

------------9. Most Profitable Customer:---------

SELECT TOP 1 Customer_Name, SUM(Profit) AS Total_Profit
FROM KMS_Data
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;

---------- 10. Orders by Shipping Mode vs Order Priority:--------

SELECT Ship_Mode, COUNT(*) AS Total_Orders, AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM KMS_Data
WHERE Order_Priority = 'High'  
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Cost DESC;

--------11. 

select * from KMS_Data