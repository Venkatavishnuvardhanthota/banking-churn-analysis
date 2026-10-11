-- Query 3: Behavioral averages, churned vs existing
SELECT
    Attrition_Flag,
    ROUND(AVG(Total_Trans_Ct), 1) AS avg_trans_count,
    ROUND(AVG(Total_Trans_Amt), 2) AS avg_trans_amt,
    ROUND(AVG(Months_Inactive_12_mon), 2) AS avg_months_inactive,
    ROUND(AVG(Avg_Utilization_Ratio), 3) AS avg_utilization,
    ROUND(AVG(Contacts_Count_12_mon), 2) AS avg_contacts,
    RANK() OVER (ORDER BY AVG(Total_Trans_Ct) DESC) AS trans_count_rank
FROM bank_churners
GROUP BY Attrition_Flag;