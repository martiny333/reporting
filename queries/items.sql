--metadb:function get_items

CREATE FUNCTION get_items(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    item_id text,
    created_date timestamp with time zone,
    barcode text)
AS $$
SELECT item_id::text, created_date, barcode
    FROM item_ext
    WHERE created_date >= start_date AND created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
