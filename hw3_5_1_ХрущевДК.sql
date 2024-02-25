SELECT
    c.first_name,
    c.last_name,
    MIN(total_transactions) AS min_total_transactions
FROM
    customer c
JOIN (
    SELECT
        customer_id,
        SUM(CAST(REPLACE(list_price, ',', '.') AS NUMERIC)) AS total_transactions
    FROM
        transaction
    GROUP BY
        customer_id
) t ON c.customer_id = t.customer_id
WHERE
    total_transactions IS NOT NULL
GROUP BY
    c.first_name, c.last_name
ORDER BY
    min_total_transactions;
