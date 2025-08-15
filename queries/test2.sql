--metadb:function get_users2

CREATE FUNCTION get_users2(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    user_id text,
    barcode text,
    created_date timestamp with time zone)
AS $$
SELECT ug.user_id::text, ug.barcode, ug.created_date

    FROM folio_derived.user_groups ug
    WHERE ug.created_date >= start_date AND ug.created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
