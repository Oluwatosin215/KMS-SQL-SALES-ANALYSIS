
![JD-Mall](https://github.com/user-attachments/assets/44e6d990-9902-4102-89d4-d41358b57d87)




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

  ### Key Insights
  #### Case Scenario I: Sales and Operations
- Top-Selling Product Category: Office Supplies recorded the highest overall sales during the 2009–2012 period, indicating strong demand from corporate and small business clients.
- Regional Sales Performance: The top-performing regions in terms of sales were Lagos, Abuja, and Port Harcourt. In contrast, regions like Enugu and Kaduna showed the lowest sales volumes, highlighting areas with growth potential.
-Appliance Sales in Ontario: Sales of appliances in the Ontario region were moderate, showing that this product category has room for targeted marketing or bundling strategies in that location.
- Lowest-Spending Customers: The bottom 10 customers contributed very little revenue. This suggests an opportunity to re-engage them through personalized offers, loyalty programs, or product education.
- Costliest Shipping Method: Express Air incurred the highest cumulative shipping costs, suggesting it should be reserved for high-priority orders only. Delivery Truck was likely more economical but slower.

#### Case Scenario II: Customer and Profitability Analysis
- Most Valuable Customers: A few high-value customers accounted for a significant portion of overall sales. These customers consistently purchased office supplies, paper products, and appliances.
- Top Small Business Customer: One small business customer outperformed others in terms of total purchases, indicating potential for upselling or account-based marketing strategies.
- Most Active Corporate Customer: The corporate customer with the highest number of orders made frequent, smaller-value purchases. This pattern may benefit from consolidated ordering or volume discounts.
- Most Profitable Consumer Customer: One consumer customer stood out with consistently high-profit margins, likely due to a combination of product type and low return rate.
- Returned Items and Segments: Returned items were predominantly associated with consumer segment customers and involved sub-categories like chairs and tables — which may signal quality or fit issues.
- Shipping Method vs Order Priority: In several cases, expensive shipping methods like Express Air were used for low-priority orders, suggesting a mismatch between shipping cost and urgency. Optimization of logistics policies could improve cost-efficiency.

#### Strategic Takeaways
- Strengthen presence in underperforming regions through localized promotions.
- Focus on retaining top customers and improving service for repeat buyers.
- Optimize shipping method selection to reduce costs, especially for low-priority or low-value orders.
- Reassess product quality in categories with high return rates.
- Use purchase behavior to create targeted upselling and loyalty strategies across all customer segments.

 ##### 11. Did the company spend appropriately the shipping cost based on the order priority
 No based on the analysis we did in number 10 , the analysis shows that the major shipping method that has max total no of orders with high priority is Regular Air
 but the avg shipping cost is low compared to Delivery truck. this show that the company did not spend appropriately the shipping cost based on priority rather based on what is economical.

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
```
## Project Document
[KMS 2 data.txt](https://github.com/user-attachments/files/21059983/KMS.2.data.txt)




