SELECT
    EXTRACT(MONTH FROM TO_DATE(t.transaction_date, 'DD.MM.YYYY')) AS transaction_month,
    c.job_industry_category,
    SUM(REPLACE(t.list_price, ',', '.')::numeric) AS total_transaction_amount
FROM
    transaction t
JOIN
    customer c ON t.customer_id = c.customer_id
GROUP BY
    transaction_month, job_industry_category
ORDER BY
    transaction_month, job_industry_category;
