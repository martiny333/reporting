--metadb:function get_titles

CREATE FUNCTION get_titles(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
)
RETURNS TABLE(
    barcode text,
    loan_date timestamp with time zone)
AS $$
select barcode, loan_date
from folio_derived.loans_items
WHERE loans_items.loan_date >= start_date 
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
