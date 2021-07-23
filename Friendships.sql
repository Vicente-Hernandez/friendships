-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
SELECT concat_ws(' ', friends.first_name, friends.last_name) AS NAME
FROM users 
JOIN friendships ON friendships.user_id = users.id
JOIN users as friends ON friends.id = friendships.user_id
WHERE friendships.friend_id = 4;

-- Devuelve el recuento de todas las amistades.
SELECT concat_ws(' ', friends.first_name, friends.last_name) AS NAME, count(friendships.user_id) as 'n° friends' 
FROM users 
JOIN friendships ON friendships.user_id = users.id
JOIN users as friends ON friends.id = friendships.user_id
GROUP BY name;

-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
SELECT concat_ws(' ', users.first_name, users.last_name) AS NAME, count(friendships.user_id) AS 'n° friends'
FROM users 
JOIN friendships ON friendships.user_id = users.id
JOIN users AS friends ON friends.id = friendships.user_id
GROUP BY users.id
LIMIT 1;

-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
INSERT INTO users (first_name, last_name, created_at)
VALUES ('Gonzo', 'The Great', now());
INSERT INTO friendships (user_id, friend_id, created_at)
VALUES (6, 2, now()), (6, 4, now()), (6, 5, now());

-- Devuelve a los amigos de Eli en orden alfabético.
SELECT friends.first_name, friends.last_name
FROM users
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS friends ON friendships.friend_id = friends.id
WHERE users.id = 2;

-- Eliminar a Marky Mark de los amigos de Eli.
DELETE FROM friendships WHERE friendships.user_id = 2 AND friendships.friend_id = 5;

-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
select users.first_name, users.last_name, friends.first_name, friends.last_name
from users
join friendships on users.id = friendships.user_id
join users as friends on friendships.friend_id = friends.id;