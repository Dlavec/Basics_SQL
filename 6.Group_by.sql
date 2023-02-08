-- ---------------- GROUP BY

SELECT age, COUNT(age) FROM acme.users GROUP BY age;

SELECT 
    age, COUNT(age)
FROM
    acme.users
WHERE
    age > 20
GROUP BY age;

SELECT 
    age, COUNT(age)
FROM
    acme.users
GROUP BY age
HAVING COUNT(age) >= 2;