#      Data Analysis Report: Restaurant Database Insights (May 2025)
# Overview
As a data analyst, I conducted an in-depth analysis of the restaurant_db database to extract actionable insights that could enhance business decision-making. The project involved querying the menu_items and order_details tables using SQL to address a series of business-relevant questions. This report documents the analytical process, key findings, and recommendations, showcasing my skills in data exploration, query optimization, and insight generation.

#      Data Analysis Process
# Dataset Description
Tables Analyzed:
menu_items: Contains details such as menu_item_id, item_name, category, and price.
order_details: Includes order_details_id, order_id, item_id, and order_date, tracking individual item orders.
Objective: Identify trends, optimize menu offerings, and improve operational efficiency based on historical order data.


#     Analytical Questions and Insights
1/ Menu Item Overview:
Queried SELECT * FROM menu_items to review all menu items, establishing a baseline for analysis.
Counted items with SELECT COUNT(*) FROM menu_items, revealing the total menu size.
2/ Price Range Analysis:
Ordered items by price (SELECT * FROM menu_items ORDER BY price) to identify the least expensive item (Edamame) and by descending price (ORDER BY price DESC) to find the most expensive (Shrimp Scampi), aiding pricing strategy reviews.
3/ Category-Specific Analysis:
Calculated Italian dish count (SELECT COUNT(*) FROM menu_items WHERE category = 'italian') to assess category representation.
Identified price extremes within Italian dishes (WHERE category = 'italian' ORDER BY price and ORDER BY price DESC), supporting targeted menu adjustments.
4/ Category Distribution:
Grouped data by category (SELECT category, COUNT(menu_item_id) AS num_of_dishes FROM menu_items GROUP BY category) to determine dish counts per category, highlighting popular segments.
Computed average dish price per category (SELECT category, AVG(price) AS avg_of_dishes FROM menu_items GROUP BY category), though corrected to AVG(price) for accuracy, revealing cost trends.
5/ Order Details Exploration:
Reviewed SELECT * FROM order_details to understand order structure, noting order_id frequency as order volume indicator.
Determined date range (SELECT MIN(order_date), MAX(order_date) FROM order_details), establishing the analysis period.
6/ Order Volume Insights:
Counted unique orders (SELECT COUNT(DISTINCT order_id) FROM order_details) and total items ordered (SELECT COUNT(*) FROM order_details) to gauge activity levels.
Identified top orders by item count (SELECT order_id, COUNT(item_id) AS num_items FROM order_details GROUP BY order_id ORDER BY num_items DESC), spotlighting high-volume orders.
7/ Large Order Analysis:
Filtered orders with over 10 items using a subquery (SELECT COUNT(*) FROM (SELECT order_id, COUNT(item_id) AS num_items FROM order_details GROUP BY order_id HAVING num_items > 10) AS num_orders), informing capacity planning.
8/ Joined Data Analysis:
Combined menu_items and order_details with INNER JOIN (SELECT * FROM order_details od INNER JOIN menu_items mi ON od.order_id = mi.menu_item_id), corrected to od.item_id = mi.menu_item_id for accurate linking, to analyze order-item relationships.
Ranked most and least ordered items (SELECT item_name, COUNT(order_details_id) AS num_purchases FROM order_details od INNER JOIN menu_items mi ON od.item_id = mi.menu_item_id GROUP BY item_name ORDER BY num_purchases DESC), identifying demand patterns.
9/ Category Demand:
Extended ranking to include category (SELECT item_name, category, COUNT(order_details_id) AS num_purchases ... GROUP BY item_name, category ORDER BY num_purchases DESC), linking popularity to categories.
10/ Revenue Analysis:
Calculated top 5 spending orders (SELECT order_id, SUM(price) AS total_spend FROM order_details od INNER JOIN menu_items mi ON od.item_id = mi.menu_item_id GROUP BY order_id ORDER BY total_spend DESC LIMIT 5), highlighting high-value customers.
Detailed the highest spend order (WHERE order_id = 130 GROUP BY category) and top 5 (WHERE order_id IN (130, 131, 110, 109, 107) GROUP BY order_id, category), revealing category preferences.


#   Key Findings
Menu Composition: The menu features a diverse range of items, with Italian dishes underrepresented (specific count pending correction of query logic).
Pricing Insights: Edamame is the least expensive, while Shrimp Scampi is the priciest, suggesting opportunities for mid-range offerings.
Order Trends: The dataset spans a defined period with significant order volume, with some orders exceeding 10 items, indicating potential for bulk deals.
Popular Items: Top-ordered items clustered in certain categories, though exact names require query refinement.
High Spenders: Orders like 130 showed strong Italian category preference, suggesting a demand for Italian cuisine expansion.
#  Recommendations
Menu Optimization: Increase Italian dish offerings based on order and spend data to cater to customer preferences.
Pricing Strategy: Introduce mid-tier items to bridge the price gap between Edamame and Shrimp Scampi.
Operational Adjustments: Prepare for high-item orders by optimizing kitchen capacity and offering bulk discounts.
Further Analysis: Refine join conditions and recalculate averages to ensure data accuracy for strategic decisions.
Analytical Skills Demonstrated
Data Exploration: Effectively navigated and queried relational database tables to extract meaningful insights.
Query Optimization: Identified and corrected join conditions (e.g., order_id to item_id) to ensure data integrity.
Insight Generation: Translated raw data into actionable business recommendations, such as menu expansion and pricing adjustments.
Problem-Solving: Addressed inconsistencies (e.g., text-based quantities in prior analyses) and proposed data validation steps.
#  Conclusion
This analysis transformed raw restaurant data into a strategic asset, providing a foundation for menu enhancements and operational improvements. The process highlights my proficiency in SQL querying, data interpretation, and business application. Future work could involve predictive modeling or customer segmentation to further drive growth.
