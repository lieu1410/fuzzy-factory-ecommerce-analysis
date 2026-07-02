--VIEW 3: vw_channel_performance
CREATE VIEW vw_channel_performance AS
SELECT
    utm_source,
    utm_campaign,
    COUNT(DISTINCT ws.website_session_id) AS sessions,
    COUNT(DISTINCT o.order_id)            AS orders,
    CAST(COUNT(DISTINCT o.order_id) AS FLOAT) 
        / NULLIF(COUNT(DISTINCT ws.website_session_id), 0) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o 
ON ws.website_session_id = o.website_session_id
GROUP BY utm_source, utm_campaign
