--metadb:function get_items

CREATE FUNCTION get_items(
    rec_number INTEGER DEFAULT 100,
)
RETURNS TABLE(
    id text,
    barcode text)
AS $$
SELECT id::text, barcode

    FROM folio_derived.item_ext
    limit rec_number
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
