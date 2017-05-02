INSERT INTO customers (first_name, last_name, cc_id, address, email, password)
SELECT * FROM (SELECT 'June', 'Tang', '1234 5678 9876 5432', 'new address', 'test@uci.edu', 'test') AS tmp
WHERE EXISTS (SELECT id FROM creditcards WHERE id = '1234 5678 9876 5432');