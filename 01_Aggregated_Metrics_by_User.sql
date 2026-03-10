SELECT
  user_pseudo_id,
  -- Target variable: Total spending amount
  SUM(COALESCE(event_value_in_usd, 0)) AS total_revenue,
  -- Feature variables: Number of key funnel steps
  COUNTIF(event_name = 'view_item') AS product_views,
  COUNTIF(event_name = 'add_to_cart') AS cart_additions,
  COUNTIF(event_name = 'begin_checkout') AS checkout_starts,
  COUNTIF(event_name = 'select_promotion') AS promo_clicks,
  -- Categorical variables: The channel and device through which the user first enters the system
  ANY_VALUE(traffic_source.medium) AS medium,
  ANY_VALUE(device.category) AS device_category
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
GROUP BY
  1
HAVING
  product_views > 0 -- Filter out inactive traffic that hasn't even viewed the product