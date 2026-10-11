-- Query 4: Top 50 attrited customers by credit limit, ties broken by transaction amount.
-- Credit_Limit has a hard ceiling (34516) shared by 508 customers (see data-quality notes);
-- ROW_NUMBER() + secondary sort on Total_Trans_Amt gives a deterministic top 50
-- instead of RANK(), which would assign every tied row the same rank.
WITH ranked_churned AS (
    SELECT
        CLIENTNUM,
        Credit_Limit,
        Total_Trans_Amt,
        Avg_Utilization_Ratio,
        Months_Inactive_12_mon,
        ROW_NUMBER() OVER (ORDER BY Credit_Limit DESC, Total_Trans_Amt DESC) AS credit_rank
    FROM bank_churners
    WHERE Attrition_Flag = 'Attrited Customer'
)
SELECT CLIENTNUM, Credit_Limit, Total_Trans_Amt, Avg_Utilization_Ratio, Months_Inactive_12_mon, credit_rank
FROM ranked_churned
WHERE credit_rank <= 50
ORDER BY credit_rank;