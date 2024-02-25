WITH TransactionIntervals AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.job_title,
        t.transaction_date::DATE,
        LEAD(t.transaction_date::DATE) OVER (PARTITION BY c.customer_id ORDER BY t.transaction_date::DATE) AS next_transaction_date,
        (LEAD(t.transaction_date::DATE) OVER (PARTITION BY c.customer_id ORDER BY t.transaction_date::DATE) - t.transaction_date::DATE)::INTEGER AS interval_days
    FROM
        customer c
    JOIN
        transaction t ON c.customer_id = t.customer_id
)
SELECT
    customer_id,
    first_name,
    last_name,
    job_title,
    MAX(interval_days) AS max_interval_days
FROM
    TransactionIntervals
GROUP BY
    customer_id, first_name, last_name, job_title
ORDER BY
    max_interval_days DESC;





