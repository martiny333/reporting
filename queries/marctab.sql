--ldp:function marctab

DROP FUNCTION IF EXISTS marctab

CREATE FUNCTION marctab(
    marc_fld text DEFAULT '245',
    marc_sf text DEFAULT 'a',
    marc_value text DEFAULT ''
)
RETURNS TABLE(
    srs_id text,
    instance_hrid text
    field text,
    sf text,
    "content" text)
AS $$
SELECT srs_id, instance_hrid,field,sf,"content"
    FROM local.t2xx
    WHERE "content" ilike 'China%'
    limit 200
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
