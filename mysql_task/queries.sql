# 1st query

SELECT product_name, product_img_url, product_url, product_price_min, product_short_description
FROM grommet_products
WHERE is_sold_out = 0
  AND id IN (SELECT product_id FROM grommet_product_categories WHERE product_category_id IN (SELECT id FROM grommet_gifts_categories WHERE sub_category = "Jewelry"));


# 2nd query

SELECT product_name, product_img_url, product_url, product_price_min, product_short_description
FROM grommet_products
WHERE is_sold_out = 0
  AND id IN (SELECT product_id FROM grommet_product_to_keyword WHERE keyword_id IN (SELECT id FROM grommet_product_keywords WHERE keyword = "Hair accessor"));


# 3rd query

SELECT
    p1.product_name,
    p2.product_img_url,
    p2.product_url,
    p2.product_price_min,
    p2.product_short_description
FROM
    grommet_products p1
        JOIN grommet_product_categories pc ON p1.id = pc.product_id
        JOIN grommet_product_to_keyword ptk ON p1.id = ptk.product_id
        JOIN grommet_products p2 ON p2.id = p1.id
        JOIN grommet_gifts_categories g ON g.id = p1.id;
