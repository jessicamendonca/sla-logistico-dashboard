SELECT 
  order_id,
  client_name,
  promised_date,
  delivered_date,
  CASE 
    WHEN delivered_date <= promised_date THEN 'No Prazo'
    ELSE 'Atraso'
  END AS sla_status
FROM orders;