
  create view "warehouse"."public"."report__dbt_tmp"
    
    
  as (
    SELECT SUM(amount) as "volume of transactions", type
FROM public.financial_transactions
GROUP BY type
  );