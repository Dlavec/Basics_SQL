-- ---------------- Nueva tabla de comentarios con 2 claves foraneas; uso de LEFT Y RIGHT JOIN (La idea es poder relacionar los comentarios con los posts y con el usuario)

-- Como hice antes, creo una tabla vacia
CREATE TABLE comments(
	id INT AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    body TEXT,
    publish_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) references users(id),
    FOREIGN KEY(post_id) references posts(id));
    
-- Agrego datos a la tabla
INSERT INTO comments(post_id, user_id, body) 
VALUES 
(1, 3, 'Este es el comentario uno'),
(2, 1, 'Este es el comentario dos'),
(5, 3, 'Este es el comentario tres'),
(2, 8, 'Este es el comentario cuatro'),
(1, 2, 'Este es el comentario cinco'),
(3, 10, 'Este es el comentario seis'),
(3, 2, 'Este es el comentario siete'),
(5, 9, 'Este es el comentario ocho'),
(2, 3, 'Este es el comentario nueve'),
(6, 6, 'Este es el comentario diez');

SELECT 
    *
FROM
    acme.comments;

/* Ahora uno las tablas usando left join:
-Elijo los campos que quiero ver de ambas tablas
-Tomo la tabla comments y le uno la tabla posts conectandolas por ID del post
-ordeno por titulo */
SELECT 
    posts.id, comments.body, posts.title
FROM
    comments
        LEFT JOIN
    posts ON posts.id = comments.post_id
ORDER BY posts.title;

-- Notar que si hubiera usando RIGHT JOIN hubiera obtenido valores null, ya que se muestran todas las publicaciones aunque no tengan comentarios
SELECT 
    posts.id, comments.body, posts.title
FROM
    comments
        RIGHT JOIN
    posts ON posts.id = comments.post_id
ORDER BY posts.title;

-- Tambien puedo unir multiples tablas
SELECT 
    comments.body,
    posts.title,
    users.first_name,
    users.last_name
FROM
    comments
        INNER JOIN
    posts ON posts.id = comments.post_id
        INNER JOIN
    users ON users.id = comments.user_id
ORDER BY posts.title;
