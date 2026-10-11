-- Query 5: Attrition rate by income category, excluding Unknown
SELECT
    Income_Category,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_count,
    COUNT(*) AS total_count,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM bank_churners
WHERE Income_Category != 'Unknown'
GROUP BY Income_Category
ORDER BY attrition_rate DESC;