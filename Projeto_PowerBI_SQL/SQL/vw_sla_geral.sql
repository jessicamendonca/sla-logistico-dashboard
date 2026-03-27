SELECT 
  ROUND(
    (SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS sla_geral_percentual
FROM orders;