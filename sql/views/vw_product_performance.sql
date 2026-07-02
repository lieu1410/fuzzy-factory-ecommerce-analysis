--VIEW 4:vw_product_performance
create view vw_product_performance as 
SELECT p.product_name,     
        COUNT(DISTINCT oi.order_id)  AS total_orders,     
        SUM(oi.price_usd)            AS revenue,     
        SUM(oi.price_usd - oi.cogs_usd)  AS profit,     
        COUNT(r.order_item_id)         AS total_refunds,     
        CAST(COUNT(r.order_item_id) AS FLOAT) / NULLIF(COUNT(oi.order_item_id), 0) AS refund_rate 
 FROM products p LEFT JOIN [dbo].[order_items] oi      
     ON p.product_id = oi.product_id 
 LEFT JOIN [dbo].[order_item_refunds] r      
     ON r.order_item_id = oi.order_item_id 
 GROUP BY p.product_name
