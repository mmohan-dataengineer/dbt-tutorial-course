/*
WITH source AS (
        SELECT *
        FROM {{ source('thelook_ecommerce', 'orders') }}
)

SELECT
        order_id,
        user_id,
        status,
        created_at,
        returned_at,
        shipped_at,
        delivered_at,
        num_of_item
FROM source
*/

--{{ config(tags=['staging'])}}
WITH source AS (
	SELECT *
	FROM {{ source('thelook_ecommerce', 'orders') }}
)
SELECT
	-- IDs
	order_id,
	user_id,
	-- Timestamps
	created_at,
	returned_at,
	delivered_at,
	shipped_at,
	-- Other columns
	status,
	num_of_item AS num_items_ordered
FROM source