CREATE TABLE IF NOT EXISTS orders (
  order_id INTEGER PRIMARY KEY,
  client_id INTEGER,
  client_name TEXT,
  segment TEXT,
  order_date DATE,
  promised_date DATE,
  delivered_date DATE,
  status TEXT,
  region TEXT,
  carrier TEXT
);

