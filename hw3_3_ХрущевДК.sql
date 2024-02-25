SELECT
    brand,
    COUNT(*) AS online_order_count
FROM
    transaction t
JOIN
    customer c ON t.customer_id = c.customer_id
WHERE
    t.order_status = 'Approved'
    AND c.job_industry_category = 'IT'
    AND t.online_order = 'True'
GROUP BY
    brand
ORDER BY
    online_order_count DESC;