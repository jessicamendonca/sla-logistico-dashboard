SELECT 
  region,
  COUNT(*) AS total_entregas,
  ROUND(
    (SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS sla_percentual
FROM orders
GROUP BY region
ORDER BY sla_percentual;