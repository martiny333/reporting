--ldp:function expdenditure

DROP FUNCTION IF EXISTS expenditure;

CREATE FUNCTION expenditure(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    id text,
    created_date timestamp with time zone,
    barcode text)
AS $$
SELECT id::text, created_date, barcode

    FROM item_ext ie
    WHERE ie.created_date >= start_date AND ie.created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
