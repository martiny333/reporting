--ldp:function items

CREATE FUNCTION items(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    item_hrid text,
    barcode text,
    created_date timestamp with time zone
    )
AS $$
SELECT item_hrid, barcode, created_date
    
    FROM folio_reporting.item_ext
    WHERE WHERE created_date > start_date and created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
