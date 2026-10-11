-- Query 2: Attrition rate by card category
WITH card_attrition AS (
    SELECT
        Card_Category,
        SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_count,
        COUNT(*) AS total_count
    FROM bank_churners
    GROUP BY Card_Category
)
SELECT
    Card_Category,
    churned_count,
    total_count,
    ROUND(churned_count * 100.0 / total_count, 2) AS attrition_rate
FROM card_attrition
ORDER BY attrition_rate DESC;