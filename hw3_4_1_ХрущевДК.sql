SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(CAST(REPLACE(t.list_price, ',', '.') AS NUMERIC)) AS total_transactions,
    MAX(CAST(REPLACE(t.list_price, ',', '.') AS NUMERIC)) AS max_transaction,
    MIN(CAST(REPLACE(t.list_price, ',', '.') AS NUMERIC)) AS min_transaction,
    COUNT(t.transaction_id) AS transaction_count
FROM
    customer c
JOIN
    transaction t ON c.customer_id = t.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_transactions DESC, transaction_count DESC;
