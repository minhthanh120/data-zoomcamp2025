SELECT SUM(amount) as "volume of transactions", type
FROM public.financial_transactions
GROUP BY type