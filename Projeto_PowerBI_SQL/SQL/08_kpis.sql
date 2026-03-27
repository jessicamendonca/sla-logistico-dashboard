SELECT 
  client_name,
  COUNT(*) AS total_entregas,
  SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) AS entregas_no_prazo,
  ROUND(
    (SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS sla_percentual
FROM orders
GROUP BY client_name
ORDER BY sla_percentual ASC;