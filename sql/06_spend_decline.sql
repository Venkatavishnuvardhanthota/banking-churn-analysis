-- Query 6: Spend-change signal (Q4 vs Q1), churned vs existing
WITH spend_change AS (
    SELECT
        Attrition_Flag,
        AVG(Total_Amt_Chng_Q4_Q1) AS avg_amt_change,
        AVG(Total_Ct_Chng_Q4_Q1) AS avg_ct_change
    FROM bank_churners
    GROUP BY Attrition_Flag
)
SELECT
    Attrition_Flag,
    ROUND(avg_amt_change, 3) AS avg_amt_change,
    ROUND(avg_ct_change, 3) AS avg_ct_change,
    CASE WHEN avg_amt_change < 1 THEN 'Declining Spend' ELSE 'Growing or Stable' END AS spend_trend
FROM spend_change;