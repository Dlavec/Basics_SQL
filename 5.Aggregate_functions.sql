-- ---------------- Aggregate functions

-- Conteo de registros
SELECT 
    COUNT(id)
FROM
    acme.users;

-- Promedio de todas las edades
SELECT 
    AVG(age)
FROM
    acme.users;

-- Sumatoria de todas las edades
SELECT 
    SUM(age)
FROM
    acme.users;
    
-- Calculo maximo y minimo (Para esto primero modifico el tipo de dato de la columna a integer)
    ALTER TABLE acme.users MODIFY COLUMN age INT;

    SELECT MIN(age) FROM acme.users;
    
	SELECT MAX(age) FROM acme.users;

-- UCASE mayuscula, LCASE minuscula
SELECT UCASE(first_name), LCASE(last_name) FROM acme.users;