--ldp:function get_items

CREATE FUNCTION get_items(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    id text,
    created_date timestamp with time zone,
    barcode text)
AS $$
SELECT id::text, created_date, barcode

    FROM item_ext
    WHERE item_ext.created_date >= start_date AND item_ext.created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
