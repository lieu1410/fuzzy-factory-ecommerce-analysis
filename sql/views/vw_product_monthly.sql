 --VIEW 5: vw_product_monthly
CREATE VIEW vw_product_monthly AS
SELECT
    YEAR(o.created_at)  AS yr,
    MONTH(o.created_at) AS mo,
    p.product_name,
    SUM(oi.price_usd)   AS revenue,
    COUNT(DISTINCT o.order_id) AS orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p    ON oi.product_id = p.product_id
GROUP BY 
    YEAR(o.created_at),
    MONTH(o.created_at),
    p.product_name
