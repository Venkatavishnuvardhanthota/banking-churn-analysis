-- Query 1: Overall attrition rate
SELECT 
    Attrition_Flag,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM bank_churners
GROUP BY Attrition_Flag;
