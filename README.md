# KMS-SQL-SALES-ANALYSIS
This project analyzes sales data for **Kultra Mega Stores**, a Nigerian office supply and furniture company. Using **SQL Server**, I examined sales performance, customer segments, shipping methods, and regional trends to support business decisions.
## Dataset Overview

- **File:** `KMS SQL Case Study.csv`
- **Period:** 2009–2012
- **Fields include:**  
  - Order ID, Order Date, Region  
  - Product Category, Sub-Category  
  - Sales, Profit, Shipping Cost  
  - Ship Mode, Customer Segment, Order Quantity
 
    ## Business Questions Solved

### **Case Scenario I: Regional & Product Insights**

1. Which product category had the highest sales?
2. Top 3 and bottom 3 regions in terms of sales  
3. Total sales of appliances in Ontario  
4. Bottom 10 customers by total sales  
5. Shipping method that incurred the most cost

###  **Case Scenario II: Customer & Shipping Insights**

6.  Who are the most valuable customers, and what do they buy?  
7.  Which small business customer had the highest sales?  
8.  Which corporate customer placed the most orders from 2009–2012?  
9.  Which consumer customer was the most profitable one?  
10.  Does the company spend shipping cost wisely based on order priority?

###  Tools Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* Microsoft Excel (for formatting results)
* GitHub (for version control & publishing)

  ### Data Analysis
  ``` sql
   SELECT Product_category, SUM(Sales) as Total_Sales
  FROM KMS_Data
  Group By Product_Category
  Order by Total_Sales Desc;
  
  SELECT Top 3 Region, Sum(Sales)as Total_Sales 
  FROM KMS_Data
  Group By Region
  Order By Total_Sales Desc;
  
  SELECT SUM(Sales) AS Appliance_Sales
  FROM KMS_Data
  WHERE Product_Sub_Category = 'Appliances'
  AND Region = 'Ontario';

  SELECT Top 10 Customer_Name, Sum(Sales) as Total_Sales
  From KMS_Data
  Group By Customer_Name
  Order By Total_Sales Asc;

  SELECT Ship_Mode, SUM(Shipping_Cost) AS Total_Shipping_Cost
  FROM KMS_Data
  GROUP BY Ship_Mode
  ORDER BY Total_Shipping_Cost DESC;

  SELECT TOP 5 Customer_Name, SUM(Sales) AS Total_Spent
  FROM KMS_Data
  GROUP BY Customer_Name
  ORDER BY Total_Spent DESC;

  SELECT TOP 1 Customer_Name, SUM(Sales) AS Total_Sales
  FROM KMS_Data
  WHERE Customer_Segment = 'Small Business'
  GROUP BY Customer_Name
  ORDER BY Total_Sales DESC;

  SELECT TOP 1 Customer_Name, COUNT(Order_ID) AS Total_Orders
  FROM KMS_Data
  WHERE Customer_Segment = 'Corporate'
  GROUP BY Customer_Name
  ORDER BY Total_Orders DESC;

  SELECT TOP 1 Customer_Name, SUM(Profit) AS Total_Profit
  FROM KMS_Data
  WHERE Customer_Segment = 'Consumer'
  GROUP BY Customer_Name
  ORDER BY Total_Profit DESC;

  SELECT Ship_Mode, COUNT(*) AS Total_Orders, AVG(Shipping_Cost) AS Avg_Shipping_Cost
  FROM KMS_Data
  WHERE Order_Priority = 'High'  
  GROUP BY Ship_Mode
  ORDER BY Avg_Shipping_Cost DESC;
```

## Project Document
[KMS 2 data.txt](https://github.com/user-attachments/files/21059983/KMS.2.data.txt)




