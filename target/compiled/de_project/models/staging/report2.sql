WITH financial_transactions_by_years as (
    SELECT unique_id,
    date_part( 'year',"date") as year,
    amount,
    customer_id,
    type
    FROM public.financial_transactions
)

SELECT year, SUM(amount) as amount
FROM
financial_transactions_by_years
GROUP BY year
ORDER BY year ASC