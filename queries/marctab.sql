--ldp:function marctab

CREATE FUNCTION marctab(
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
SELECT srs_id, instance_hrid,field,sf,"content"
    FROM local.t2xx
    WHERE field like marc_fld AND "content" ilike marc_value and sf like marc_sf
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
