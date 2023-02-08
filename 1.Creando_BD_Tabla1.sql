-- ---------------- Creacion de una base de datos y una tabla vacia con clave primaria

-- Creo una base de datos
CREATE DATABASE acme;

-- Ver bases de datos existentes
SHOW DATABASES;

-- Especifico que base de datos quiero usar (para no tener que llamarla todo el tiempo)
USE acme;

/*Creo una tabla tal que:
-ID unico que automaticamente incremente,
-Longitud nombre y apellido 100, email 75, password 255, ubicacion 100, Departamento 75,
-Operador booleano tal que si el usuario es administrador 1, si no lo es 0
-Fecha de registro
-Clave primaria id
*/
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age VARCHAR(3),
    email VARCHAR(75),
    pass VARCHAR(255),
    location VARCHAR(100),
    dept VARCHAR(75),
    is_admin TINYINT(1),
    register_date DATETIME,
    PRIMARY KEY (id));

SHOW TABLES;
-- Hasta aquí creamos la tabla pero está vacía, no tenemos ningun usuario real
