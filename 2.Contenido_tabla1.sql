-- ---------------- Agregacion de datos a una tabla vacia y querys

-- Agrego multiples filas usando INSERT INTO
INSERT INTO users(first_name, last_name, age, email, pass, location, dept, is_admin, register_date)
VALUES ('Patty', 'Bouvier', 66, 'bouvier@gmail.com', 'abcde', 'Buenos Aires', 'development', 1, now()), 
('Bart', 'Simpsons', 20, 'bart@gmail.com', '1nnnnn5', 'Springfield', 'sales', 0, now()),
('Carl', 'Carlson', 58, 'carl@gmail.com', 'aaaaa', 'Buenos Aires', 'design', 1, now()),
('Ned', 'Flanders', 65, 'Ned@gmail.com', 'nnnnnn', 'Buenos Aires', 'development', 1, now()),
('Homero', 'Simpsons', 60, 'homer@gmail.com', 'ttttttt', 'Springfield', 'sales', 0, now()),
('Edna', 'Krabappel', 59, 'edna@gmail.com', '987456', 'Buenos Aires', 'development', 0, now()),
('Montgomery', 'Burns', 108, 'burns@gmail.com', '75539551', 'Springfield', 'design', 1, now()),
('Seymour', 'Skinner', 54, 'skinner@gmail.com', '951753', 'Buenos Aires', 'sales', 0, now()),
('Lenny', 'Leonard', 60, 'leonard@gmail.com', '741369', 'Springfield', 'development', 1, now()),
('Daiana', 'Lavecchia', 29, 'daianalavecchia@gmail.com', '12345', 'Buenos Aires', 'development', 1, now());

-- Si quiero agregar una unica fila
INSERT INTO acme.users(first_name, last_name, email, pass, location, dept, is_admin, register_date)
VALUES ('Barney', 'Gumble', 55, 'barney@gmail.com', 'fghij', 'Springfield', 'design', 0, now());

-- Actualizo el mail de Lenny, que tiene el id 9
UPDATE acme.users 
SET 
    email = 'lenny@hotmail.com'
WHERE
    id = 9;

-- Selecciono todos los campos de la tabla que cree y vemos que se generaron correctamente los 11 usuarios
SELECT 
    *
FROM
    acme.users;

-- Selecciono id, nombre y apellido de users
SELECT 
    id, first_name, last_name
FROM
    acme.users;

-- Uso la sentencia WHERE para traer nombre y apellido de los usuarios con ubicacion Springfield y el departamento sea sales
SELECT 
    first_name, last_name
FROM
    acme.users
WHERE
    location = 'Springfield'
        AND dept = 'sales';

-- Selecciono los administradores usando variables logical
SELECT 
    *
FROM
    acme.users
WHERE
    is_admin > 0;

-- Ordeno por apellido de manera ascendente (por orden alfabetico)
SELECT 
    *
FROM
    acme.users
ORDER BY last_name ASC;

-- Concateno nombre y apellido, separando con un espacio
SELECT 
    id, CONCAT(first_name, ' ', last_name) AS 'Name', dept
FROM
    acme.users;

-- Uso distinct para ver las ciudades sin repeticion
SELECT DISTINCT
    location
FROM
    acme.users;
    
-- Selecciono todos los usuarios que su edad sea entre 40 y 55 años
SELECT 
    *
FROM
    acme.users
WHERE
    age BETWEEN 40 AND 55;

-- Selecciono todos los usuarios tal que dept empiece con la letra d y termine con la letra n
SELECT 
    *
FROM
    users
WHERE
    dept LIKE 'd%n';

-- Selecciono todos los usuarios tal que no contengan "es" (sin tener en cuenta el primer ni el ultimo caracter)
SELECT 
    *
FROM
    users
WHERE
    dept NOT LIKE '%es%';

-- Notar que sacando el ultimo % hay otras coincidencias, estoy pidiendo que no termine en "es"
SELECT 
    *
FROM
    users
WHERE
    dept NOT LIKE '%es';

-- Selecciono los usuarios tales que sean de dept design y sales
SELECT 
    *
FROM
    users
WHERE
    dept IN ('design' , 'sales');