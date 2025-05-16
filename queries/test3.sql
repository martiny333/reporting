--ldp:function get_titles

CREATE FUNCTION get_titles(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    id text,
    barcode text,
    created_date timestamp with time zone)
AS $$
select pl.po_line_number, pl.title_or_package
from public.po_lines pl
WHERE pl.metadata__created_date >= start_date 
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
