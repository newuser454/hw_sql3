WITH RankedTransactions AS (
    SELECT
        transaction_id,
        customer_id,
        transaction_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date) AS row_num
    FROM
        transaction
)
SELECT
    rt.transaction_id,
    rt.customer_id,
    rt.transaction_date
FROM
    RankedTransactions rt
WHERE
    rt.row_num = 1;