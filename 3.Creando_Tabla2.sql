-- ---------------- Nueva tabla con 1 clave foranea; uso de INNER JOIN (La idea es poder relacionar los posts con los usuarios)

/* Creo una nueva tabla para publicaciones tal que:
-ID unico que automaticamente incremente,
-usuario en formato integer,
-longitud titulo 100,
-cuerpo de la publicacion en formato texto,
-fecha de publicacion en formato fecha, por default pido  la marca de tiempo actual
-clave primaria id,
-Clave foranea user_id (hace referencia a id)
*/
CREATE TABLE posts (
    id INT AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(100),
    body TEXT,
    publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);

-- Agrego datos a la tabla
INSERT INTO acme.posts(user_id, title, body) 
VALUES 
      (1, 'Post uno', 'Este es el Post 1'), 
      (10, 'Post 2', 'Este es el Post 2'),
      (1, 'Post 3', 'Este es el Post 3'),
      (2, 'Post 4', 'Este es el Post 4'),
      (5, 'Post 5', 'Este es el Post 5'),
      (5, 'Post 6', 'Este es el Post 6'),
      (2, 'Post 7', 'Este es el Post 7'),
      (8, 'Post 8', 'Este es el Post 8'),
      (3, 'Post 9', 'Este es el Post 9'),
      (4, 'Post 10', 'Este es el Post 10');

SELECT 
    *
FROM
    acme.posts;

/* Ahora uno las tablas usando inner join:
-Elijo los campos que quiero ver de ambas tablas
-Tomo la tabla users y le uno la tabla posts conectandolas por ID del usuario
-ordeno por titulo */
SELECT 
    users.id,
    users.first_name,
    users.last_name,
    posts.title,
    posts.publish_date
FROM
    users
        INNER JOIN
    posts ON users.id = posts.user_id
ORDER BY posts.title;
