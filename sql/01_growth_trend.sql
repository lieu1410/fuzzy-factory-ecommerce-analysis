/* ================================================
   Project : Fuzzy Factory E-Commerce Analysis
   Author  : Nguyen Thi Lieu
   Purpose : Monthly growth trend analysis
             Measures: sessions, orders, 
             revenue, conversion rate
   ================================================ */

SELECT
    YEAR(ws.created_at)   AS yr,
    MONTH(ws.created_at)  AS mo,
    COUNT(DISTINCT ws.website_session_id) AS sessions,
    COUNT(DISTINCT o.order_id)            AS orders,
    COALESCE(SUM(o.price_usd), 0)         AS revenue,
    CAST(COUNT(DISTINCT o.order_id) AS FLOAT)
        / NULLIF(COUNT(DISTINCT ws.website_session_id), 0) 
                                          AS conv_rate
FROM website_sessions ws
LEFT JOIN orders o 
    ON ws.website_session_id = o.website_session_id
GROUP BY 
    YEAR(ws.created_at), 
    MONTH(ws.created_at)
ORDER BY yr, mo
