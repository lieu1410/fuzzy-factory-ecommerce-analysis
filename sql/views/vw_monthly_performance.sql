-- VIEW 1: Monthly Performance (Dash 1)
CREATE VIEW vw_monthly_performance AS
SELECT
    YEAR(ws.created_at)   AS yr,
    MONTH(ws.created_at)  AS mo,
    COUNT(DISTINCT ws.website_session_id) AS sessions,
    COUNT(DISTINCT o.order_id)            AS orders,
    COALESCE(SUM(o.price_usd), 0)         AS revenue,
    COALESCE(SUM(o.price_usd - o.cogs_usd), 0) AS profit,
    CAST(COUNT(DISTINCT o.order_id) AS FLOAT)
        / NULLIF(COUNT(DISTINCT ws.website_session_id), 0) AS conv_rate
FROM website_sessions ws
LEFT JOIN orders o 
    ON ws.website_session_id = o.website_session_id
GROUP BY YEAR(ws.created_at), MONTH(ws.created_at)
