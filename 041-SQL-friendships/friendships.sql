use friendships;

SELECT u2.first_name, u2.last_name
FROM users as u1
JOIN friendships ON u1.id = friendships.user_id
JOIN users as u2 ON friendships.friend_id = u2.id
WHERE u1.id = 4;

SELECT COUNT(id)
FROM friendships;

SELECT u1.first_name, u1.last_name, MAX(COUNT(u1.id))
FROM users AS u1
JOIN friendships ON u1.id = friendships.user_id
JOIN users AS u2 ON friendships.friend_id = u2.id
GROUP BY u1.id;

INSERT INTO users (first_name, last_name, created_at, updated_at) VALUES ('Speedy', 'Gonzalez', NOW(), NOW());
SELECT id, first_name from users where id = LAST_INSERT_ID();

INSERT INTO friendships (user_id, friend_id, created_at, updated_at ) 
SELECT LAST_INSERT_ID(), id, NOW(), NOW()
FROM users
WHERE id IN (1,2,3,4);

SELECT u2.first_name, u2.last_name
FROM users as u1
JOIN friendships ON u1.id = friendships.user_id
JOIN users as u2 ON  friendships.friend_id = u2.id
WHERE u1.id = 2
ORDER BY u2.first_name ASC;

DELETE FROM friendships 
WHERE  friendships.user_id = 2 AND friendships.friend_id = 5;

SELECT u1.id, u1.first_name, u2.id, u2.first_name
FROM users AS u1
JOIN friendships ON u1.id = friendships.user_id
JOIN users AS u2 ON friendships.friend_id = u2.id;