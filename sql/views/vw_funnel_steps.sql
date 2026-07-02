-- VIEW 2: Funnel (long format cho Power BI)
CREATE VIEW vw_funnel_steps AS
WITH session_flags AS (
    SELECT
        website_session_id,
        MAX(CASE WHEN pageview_url = '/home' 
            THEN 1 ELSE 0 END) AS saw_home,
        MAX(CASE WHEN pageview_url LIKE '/lander-%' 
            THEN 1 ELSE 0 END) AS saw_lander,
        MAX(CASE WHEN pageview_url = '/products' 
            THEN 1 ELSE 0 END) AS saw_products,
        MAX(CASE WHEN pageview_url = '/the-original-mr-fuzzy' 
            THEN 1 ELSE 0 END) AS saw_mrfuzzy,
        MAX(CASE WHEN pageview_url = '/cart' 
            THEN 1 ELSE 0 END) AS saw_cart,
        MAX(CASE WHEN pageview_url = '/shipping' 
            THEN 1 ELSE 0 END) AS saw_shipping,
        MAX(CASE WHEN pageview_url IN ('/billing','/billing-2') 
            THEN 1 ELSE 0 END) AS saw_billing,
        MAX(CASE WHEN pageview_url = '/thank-you-for-your-order' 
            THEN 1 ELSE 0 END) AS saw_thankyou
    FROM website_pageviews
    GROUP BY website_session_id
),
funnel_data AS (
    SELECT 'home' AS funnel_entry,
        SUM(saw_home)     AS stage_1,
        SUM(saw_products) AS stage_2,
        SUM(saw_mrfuzzy)  AS stage_3,
        SUM(saw_cart)     AS stage_4,
        SUM(saw_shipping) AS stage_5,
        SUM(saw_billing)  AS stage_6,
        SUM(saw_thankyou) AS stage_7
    FROM session_flags WHERE saw_home = 1
    UNION ALL
    SELECT 'lander',
        SUM(saw_lander), SUM(saw_products),
        SUM(saw_mrfuzzy), SUM(saw_cart),
        SUM(saw_shipping), SUM(saw_billing),
        SUM(saw_thankyou)
    FROM session_flags WHERE saw_lander = 1
)
-- Convert sang long format
SELECT funnel_entry, '1_Entry'    AS stage, stage_1 AS sessions FROM funnel_data
UNION ALL
SELECT funnel_entry, '2_Products' AS stage, stage_2 FROM funnel_data
UNION ALL
SELECT funnel_entry, '3_MrFuzzy'  AS stage, stage_3 FROM funnel_data
UNION ALL
SELECT funnel_entry, '4_Cart'     AS stage, stage_4 FROM funnel_data
UNION ALL
SELECT funnel_entry, '5_Shipping' AS stage, stage_5 FROM funnel_data
UNION ALL
SELECT funnel_entry, '6_Billing'  AS stage, stage_6 FROM funnel_data
UNION ALL
SELECT funnel_entry, '7_Thankyou' AS stage, stage_7 FROM funnel_data

