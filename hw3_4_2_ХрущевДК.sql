SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(CAST(REPLACE(t.list_price, ',', '.') AS NUMERIC)) OVER (PARTITION BY c.customer_id) AS total_transactions,
    MAX(CAST(REPLACE(t.list_price, ',', '.') AS NUMERIC)) OVER (PARTITION BY c.customer_id) AS max_transaction,
    MIN(CAST(REPLACE(t.list_price, ',', '.') AS NUMERIC)) OVER (PARTITION BY c.customer_id) AS min_transaction,
    COUNT(t.transaction_id) OVER (PARTITION BY c.customer_id) AS transaction_count
FROM
    customer c
JOIN
    transaction t ON c.customer_id = t.customer_id
ORDER BY
    total_transactions DESC, transaction_count DESC;

