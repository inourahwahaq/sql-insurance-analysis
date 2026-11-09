USE InsuranceAnalysis;

-- Dataset size
SELECT COUNT(*) AS total_records
FROM insurance_data;

-- Customer age
SELECT
    ROUND(AVG(Age), 2) AS average_age,
    MIN(Age) AS minimum_age,
    MAX(Age) AS maximum_age
FROM insurance_data;

-- Customers by age group
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 45 THEN '30-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Over 60'
    END AS age_group,
    COUNT(*) AS customers
FROM insurance_data
GROUP BY age_group
ORDER BY customers DESC;

-- Annual premium
SELECT
    ROUND(AVG(Annual_Premium), 2) AS average_premium,
    MIN(Annual_Premium) AS minimum_premium,
    MAX(Annual_Premium) AS maximum_premium
FROM insurance_data;

-- Premium by vehicle age
SELECT
    Vehicle_Age,
    COUNT(*) AS customers,
    ROUND(AVG(Annual_Premium), 2) AS average_premium
FROM insurance_data
GROUP BY Vehicle_Age
ORDER BY average_premium DESC;

-- Top 10 regions by customers
SELECT
    Region_Code,
    COUNT(*) AS customers
FROM insurance_data
GROUP BY Region_Code
ORDER BY customers DESC
LIMIT 10;

-- Overall positive response rate (Response = 1)
SELECT
    COUNT(*) AS customers,
    SUM(Response) AS positive_responses,
    ROUND(AVG(Response) * 100, 2) AS response_rate_pct
FROM insurance_data;

-- Response rate by vehicle damage
SELECT
    Vehicle_Damage,
    COUNT(*) AS customers,
    ROUND(AVG(Response) * 100, 2) AS response_rate_pct
FROM insurance_data
GROUP BY Vehicle_Damage
ORDER BY response_rate_pct DESC;

-- Response rate by vehicle age
SELECT
    Vehicle_Age,
    COUNT(*) AS customers,
    ROUND(AVG(Response) * 100, 2) AS response_rate_pct
FROM insurance_data
GROUP BY Vehicle_Age
ORDER BY response_rate_pct DESC;

-- Response rate for customers who already have insurance
SELECT
    Previously_Insured,
    COUNT(*) AS customers,
    ROUND(AVG(Response) * 100, 2) AS response_rate_pct
FROM insurance_data
GROUP BY Previously_Insured
ORDER BY response_rate_pct DESC;

-- Response rate by age group
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 45 THEN '30-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Over 60'
    END AS age_group,
    COUNT(*) AS customers,
    ROUND(AVG(Response) * 100, 2) AS response_rate_pct
FROM insurance_data
GROUP BY age_group
ORDER BY response_rate_pct DESC;
