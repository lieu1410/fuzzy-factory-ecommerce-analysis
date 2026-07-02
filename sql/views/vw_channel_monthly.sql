CREATE VIEW vw_channel_monthly AS
SELECT
    YEAR(ws.created_at)   AS yr,
    MONTH(ws.created_at)  AS mo,
    COALESCE(ws.utm_source, 'organic_direct') AS utm_source,
    ws.utm_campaign,
    COUNT(DISTINCT ws.website_session_id) AS sessions,
    COUNT(DISTINCT o.order_id)            AS orders,
    CAST(COUNT(DISTINCT o.order_id) AS FLOAT)
        / NULLIF(COUNT(DISTINCT ws.website_session_id), 0) AS conv_rate
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY
    YEAR(ws.created_at),
    MONTH(ws.created_at),
    COALESCE(ws.utm_source, 'organic_direct'),
    ws.utm_campaign
