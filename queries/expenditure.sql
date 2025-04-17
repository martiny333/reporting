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
select pl.po_line_number, pl.title_or_package,  count(pl.po_line_number) as "quantity"
from public.po_lines pl
left join public.invoice_lines il on il.po_line_id = pl.id
left join public.invoice_invoices ii on il.invoice_id = ii.id --fiscal_year_id, status 
where 
ii.payment_date between symmetric start_date and end_date
group by pl.po_line_number, pl.title_or_package, "quantity"
order by "quantity"  Desc
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
