--ldp:function items

CREATE FUNCTION items(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    id text,
    barcode text,
    created_date timestamp with time zone)
AS $$
SELECT id::text, barcode, created_date

    FROM item_ext ie
    WHERE ie.created_date >= start_date AND ie.created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
