CREATE VIEW vw_sla_geral AS
SELECT 
  ROUND(
    (SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS sla_geral_percentual
FROM orders;

CREATE VIEW vw_sla_por_cliente AS
SELECT 
  client_name,
  COUNT(*) AS total_entregas,
  ROUND(
    (SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS sla_percentual
FROM orders
GROUP BY client_name;

CREATE VIEW vw_sla_por_regiao AS
SELECT 
  region,
  COUNT(*) AS total_entregas,
  ROUND(
    (SUM(CASE WHEN delivered_date <= promised_date THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS sla_percentual
FROM orders
GROUP BY region;