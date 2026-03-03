-- Bank Customer Churn SQL Analysis Queries
-- These queries can be run after loading bank_churn_clean.csv into a SQL database

-- 1. Overall churn rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn;

-- 2. Churn by Geography
SELECT 
    Geography,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY Geography
ORDER BY churn_rate_pct DESC;

-- 3. Churn by Gender
SELECT 
    Gender,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY Gender
ORDER BY churn_rate_pct DESC;

-- 4. Churn by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 45 THEN '30-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS total,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY age_group
ORDER BY churn_rate_pct DESC;

-- 5. Churn by Number of Products
SELECT 
    NumOfProducts,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- 6. Churn by Credit Score Range
SELECT 
    CASE 
        WHEN CreditScore < 600 THEN 'Poor (<600)'
        WHEN CreditScore BETWEEN 600 AND 699 THEN 'Fair (600-699)'
        WHEN CreditScore BETWEEN 700 AND 799 THEN 'Good (700-799)'
        ELSE 'Excellent (800+)'
    END AS credit_score_range,
    COUNT(*) AS total,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY credit_score_range
ORDER BY churn_rate_pct DESC;

-- 7. High value churned customers (Balance > 100,000)
SELECT 
    *
FROM bank_churn
WHERE Exited = 1 
    AND Balance > 100000
ORDER BY Balance DESC;

-- 8. Active vs Inactive Member Churn
SELECT 
    IsActiveMember,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY IsActiveMember
ORDER BY churn_rate_pct DESC;

-- 9. Churn by Tenure
SELECT 
    Tenure,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY Tenure
ORDER BY Tenure;

-- 10. Average metrics for churned vs retained customers
SELECT 
    Exited,
    ROUND(AVG(CreditScore), 2) AS avg_credit_score,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(Tenure), 2) AS avg_tenure,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(NumOfProducts), 2) AS avg_num_products,
    ROUND(AVG(EstimatedSalary), 2) AS avg_salary
FROM bank_churn
GROUP BY Exited;

-- 11. Geography and Gender combined analysis
SELECT 
    Geography,
    Gender,
    COUNT(*) AS total,
    SUM(Exited) AS churned,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate_pct
FROM bank_churn
GROUP BY Geography, Gender
ORDER BY churn_rate_pct DESC;

-- 12. Customers at high risk (multiple risk factors)
SELECT 
    *
FROM bank_churn
WHERE Exited = 0
    AND Age > 40
    AND NumOfProducts = 1
    AND IsActiveMember = 0
    AND Balance > 0
ORDER BY Balance DESC
LIMIT 100;
