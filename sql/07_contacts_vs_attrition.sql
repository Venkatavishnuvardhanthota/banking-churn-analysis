-- Query 7: Attrition rate by bank-contact frequency, 5 and 6 contacts merged into "5+"
-- (bucket 6 alone was n=54 with 100% attrition — too thin to report standalone)
SELECT
    CASE WHEN Contacts_Count_12_mon >= 5 THEN '5+' ELSE CAST(Contacts_Count_12_mon AS CHAR) END AS contact_bucket,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned_count,
    COUNT(*) AS total_count,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM bank_churners
GROUP BY contact_bucket
ORDER BY contact_bucket;