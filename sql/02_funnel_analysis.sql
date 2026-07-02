-- BƯỚC 1: Tạo CTE chứa flags
WITH session_flags AS (
    SELECT
        website_session_id,
        MAX(CASE WHEN pageview_url = '/home' 
            THEN 1 ELSE 0 END) AS saw_home,
        MAX(CASE WHEN pageview_url IN ('/lander-1','/lander-2',
            '/lander-3','/lander-4','/lander-5') 
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
)

SELECT
    SUM(saw_home) AS total_home,
    SUM(saw_lander) AS total_lander,
    SUM(saw_products) AS total_products,
    SUM(saw_mrfuzzy) AS total_mrfuzzy,
    SUM(saw_cart) AS total_cart,
    SUM(saw_shipping) AS total_shipping,
    SUM(saw_billing) AS total_billing,
    SUM(saw_thankyou) AS total_thankyou,

    -- Drop-off rates: viết cho tất cả các bước
    CAST(SUM(saw_lander) AS FLOAT) / NULLIF(SUM(saw_home), 0) AS home_to_lander,
    CAST(SUM(saw_products) AS FLOAT) / NULLIF(SUM(saw_lander), 0) AS lander_to_products,
    CAST(SUM(saw_mrfuzzy) AS FLOAT) / NULLIF(SUM(saw_products), 0) AS products_to_mrfuzzy,
    CAST(SUM(saw_cart) AS FLOAT) / NULLIF(SUM(saw_mrfuzzy), 0) AS mrfuzzy_to_cart,
    CAST(SUM(saw_shipping) AS FLOAT) / NULLIF(SUM(saw_cart), 0) AS cart_to_shipping,
    CAST(SUM(saw_billing) AS FLOAT) / NULLIF(SUM(saw_shipping), 0) AS shipping_to_billing,
CAST(SUM(saw_thankyou) AS FLOAT) / NULLIF(SUM(saw_billing), 0) AS billing_to_thankyou

FROM session_flags

-- FUNNEL A: Home sessions
WITH session_flags AS (
    SELECT
        website_session_id,
        MAX(CASE WHEN pageview_url = '/home' 
            THEN 1 ELSE 0 END)                    AS saw_home,
        MAX(CASE WHEN pageview_url LIKE '/lander-%' 
            THEN 1 ELSE 0 END)                    AS saw_lander,
        MAX(CASE WHEN pageview_url = '/products' 
            THEN 1 ELSE 0 END)                    AS saw_products,
        MAX(CASE WHEN pageview_url = '/the-original-mr-fuzzy' 
            THEN 1 ELSE 0 END)                    AS saw_mrfuzzy,
        MAX(CASE WHEN pageview_url = '/cart' 
            THEN 1 ELSE 0 END)                    AS saw_cart,
        MAX(CASE WHEN pageview_url = '/shipping' 
            THEN 1 ELSE 0 END)                    AS saw_shipping,
        MAX(CASE WHEN pageview_url IN ('/billing','/billing-2') 
            THEN 1 ELSE 0 END)                    AS saw_billing,
        MAX(CASE WHEN pageview_url = '/thank-you-for-your-order' 
            THEN 1 ELSE 0 END)                    AS saw_thankyou
    FROM website_pageviews
    GROUP BY website_session_id
)
SELECT
    'home'                    AS funnel_entry,
    SUM(saw_home)             AS total_entry,
    SUM(saw_products)         AS total_products,
    SUM(saw_mrfuzzy)          AS total_mrfuzzy,
    SUM(saw_cart)             AS total_cart,
    SUM(saw_shipping)         AS total_shipping,
    SUM(saw_billing)          AS total_billing,
    SUM(saw_thankyou)         AS total_thankyou,
    CAST(SUM(saw_products) AS FLOAT) / NULLIF(SUM(saw_home),0) 
                              AS entry_to_products,
    CAST(SUM(saw_mrfuzzy) AS FLOAT) / NULLIF(SUM(saw_products), 0) AS products_to_mrfuzzy,
    CAST(SUM(saw_cart) AS FLOAT) / NULLIF(SUM(saw_mrfuzzy), 0) AS mrfuzzy_to_cart,
    CAST(SUM(saw_shipping) AS FLOAT) / NULLIF(SUM(saw_cart), 0) AS cart_to_shipping,
    CAST(SUM(saw_billing) AS FLOAT) / NULLIF(SUM(saw_shipping), 0) AS shipping_to_billing,
    CAST(SUM(saw_thankyou) AS FLOAT) / NULLIF(SUM(saw_billing), 0) AS billing_to_thankyou
FROM session_flags
WHERE saw_home = 1

UNION ALL

-- FUNNEL B: Lander sessions — Bạn tự viết hoàn toàn
SELECT
    'lander'                  AS funnel_entry,
    SUM(saw_lander)           AS total_entry,
    SUM(saw_products)         AS total_products,
    SUM(saw_mrfuzzy)          AS total_mrfuzzy,
    SUM(saw_cart)             AS total_cart,
    SUM(saw_shipping)         AS total_shipping,
    SUM(saw_billing)          AS total_billing,
    SUM(saw_thankyou)         AS total_thankyou,
    CAST(SUM(saw_products) AS FLOAT) / NULLIF(SUM(saw_lander),0) 
                              AS entry_to_products,
    CAST(SUM(saw_mrfuzzy) AS FLOAT) / NULLIF(SUM(saw_products), 0) AS products_to_mrfuzzy,
    CAST(SUM(saw_cart) AS FLOAT) / NULLIF(SUM(saw_mrfuzzy), 0) AS mrfuzzy_to_cart,
    CAST(SUM(saw_shipping) AS FLOAT) / NULLIF(SUM(saw_cart), 0) AS cart_to_shipping,
    CAST(SUM(saw_billing) AS FLOAT) / NULLIF(SUM(saw_shipping), 0) AS shipping_to_billing,
    CAST(SUM(saw_thankyou) AS FLOAT) / NULLIF(SUM(saw_billing), 0) AS billing_to_thankyou
FROM session_flags
WHERE saw_lander = 1

