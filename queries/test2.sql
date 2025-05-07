--ldp:function get_users

CREATE FUNCTION get_users(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    uu.id text,
    uu.barcode text,
    uu.created_date timestamp with time zone)
AS $$
SELECT uu.id::text, uu.barcode, uu.created_date

    FROM folio_reporrrting.user_users uu
    WHERE uu.created_date >= start_date AND uu.created_date <= end_date
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
