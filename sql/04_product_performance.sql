-- revenue and refund per products
SELECT
    p.product_name,
    COUNT(DISTINCT oi.order_id)                   AS total_orders,
    SUM(oi.price_usd)                             AS revenue,
    SUM(oi.price_usd - oi.cogs_usd)              AS profit,
    COUNT(r.order_item_id)                        AS total_refunds,
    CAST(COUNT(r.order_item_id) AS FLOAT) 
        / NULLIF(COUNT(oi.order_item_id), 0)      AS refund_rate
FROM products p
LEFT JOIN [dbo].[order_items] oi 
    ON p.product_id = oi.product_id
LEFT JOIN [dbo].[order_item_refunds] r 
    ON r.order_item_id = oi.order_item_id
GROUP BY p.product_name
ORDER BY revenue DESC

-- monthly revenue
SELECT
    YEAR(o.created_at)                    AS yr,
    MONTH(o.created_at)                   AS mo,
    COUNT(DISTINCT o.order_id)            AS orders,
    SUM(oi.price_usd)                     AS revenue,
    -- Revenue by product
    SUM(CASE WHEN oi.product_id = 1 
        THEN oi.price_usd ELSE 0 END)     AS mrfuzzy_rev,
    SUM(CASE WHEN oi.product_id = 2 
        THEN oi.price_usd ELSE 0 END)     AS forever_love_rev,
    SUM(CASE WHEN oi.product_id = 3
        THEN oi.price_usd ELSE 0 END)     AS sugar_panda_rev,
    SUM(CASE WHEN oi.product_id = 4
        THEN oi.price_usd ELSE 0 END)     AS hudson_rev,
    SUM(CASE WHEN oi.product_id = 1 
        THEN oi.price_usd ELSE 0 END)/SUM(oi.price_usd) as avg_mrfuzzy
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY YEAR(o.created_at), MONTH(o.created_at)
ORDER BY yr, mo

SELECT
    YEAR(o.created_at)                    AS yr,
    SUM(oi.price_usd)                     AS revenue,
    -- Revenue by product
    SUM(CASE WHEN oi.product_id = 1 
        THEN oi.price_usd ELSE 0 END)     AS mrfuzzy_rev,
    SUM(CASE WHEN oi.product_id = 1 
        THEN oi.price_usd ELSE 0 END)/SUM(oi.price_usd) as avg_mrfuzzy
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY YEAR(o.created_at)
ORDER BY yr
