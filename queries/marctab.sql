--ldp:function get_users
CREATE FUNCTION get_users(
    marc_fld text DEFAULT '245',
    marc_sf text DEFAULT 'a',
    marc_value text DEFAULT ''
)
RETURNS TABLE(
    srs_id text,
    instance_hrid text
    field text,
    "content" text)
AS $$
SELECT srs_id, instance_hrid,field,"content"
    FROM local.t2xx
    WHERE field ilike marc_fld AND "content" ilike marc_value and sf like marc_sf
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
