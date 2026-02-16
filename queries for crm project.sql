use crm;

# Total number of Opportunities #

SELECT COUNT(Opportunity_ID) AS total_opportunities
FROM opportunity;

# Won Opportunities #
SELECT COUNT(DISTINCT Opportunity_ID) AS won_opportunities
FROM opportunity
WHERE Won = 'TRUE';

# Opportunity Win Rate Percentage
SELECT 
    ROUND(
        COUNT(CASE WHEN Won = 'TRUE' THEN 1 END) * 100.0 
        / COUNT(*),
    2) AS win_rate_pct
FROM opportunity;

# Products Sold per Opportunity #

SELECT 
    ROUND(AVG(Quantity), 2) AS avg_products_per_opportunity
FROM opportunity_product;

# Product wise win contribution #
SELECT 
    Product_Name,
    COUNT(Opportunity_ID) AS won_deals
FROM opportunity_product
GROUP BY Product_Name
ORDER BY won_deals DESC;


# Year-Over-Year Opportunity Growth #
SELECT 
    YEAR(Created_date) AS year,
    COUNT(Opportunity_ID) AS total_opportunities
FROM opportunity
GROUP BY YEAR(Created_date)
ORDER BY year;

# Total Leads #

SELECT COUNT(Lead_ID) AS Total_lead
FROM lead1;

# Lead Conversion Rate Percentage #
SELECT 
    ROUND(
        COUNT(CASE WHEN converted = 'TRUE' THEN 1 END) * 100.0 
        / COUNT(*), 
    2
    ) AS conversion_rate_pct
FROM lead1;

# Monthly Lead Growth Trend #

SELECT 
    YEAR(Created_Date) AS year,
    MONTH(Created_Date) AS month,
    COUNT(Lead_ID) AS total_leads
FROM lead1
GROUP BY YEAR(Created_Date), MONTH(Created_Date)
ORDER BY year, month;

# Top Lead sources by Conversion #

SELECT 
    Lead_Source,
    COUNT(Lead_ID) AS total_leads,
    COUNT(CASE WHEN Converted = 'TRUE' THEN 1 END) AS converted_leads
FROM lead1
GROUP BY Lead_Source;

# Country-wise Lead Conversion Performance #
SELECT 
    Country,
    COUNT(Lead_ID) AS total_leads,
    COUNT(CASE WHEN Converted = 'TRUE' THEN 1 END) AS converted_leads
FROM lead1
GROUP BY Country
ORDER BY converted_leads DESC;

# Lead Status Funnel Breakdown #

SELECT 
    Status,
    COUNT(Lead_ID) AS total_leads
FROM lead1
GROUP BY Status
ORDER BY total_leads DESC;



