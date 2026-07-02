-- tính sessions theo kênh và campaign
SELECT 
    utm_source,
    utm_campaign,
    COUNT(*) AS sessions
FROM website_sessions
WHERE utm_source IS NOT NULL
GROUP BY utm_source, utm_campaign
ORDER BY sessions DESC
-- drop ở các channel
SELECT
    utm_source,
    utm_campaign,
    COUNT(DISTINCT ws.website_session_id) AS 'sessions',
    COUNT(DISTINCT o.order_id)            AS orders,
    -- Conversion rate
    cast(COUNT(DISTINCT o.order_id) as float)/ COUNT(DISTINCT ws.website_session_id) as 'conversion_rate'
FROM website_sessions ws
LEFT JOIN orders o 
    ON ws.website_session_id = o.website_session_id
GROUP BY utm_source, utm_campaign
ORDER BY sessions DESC
