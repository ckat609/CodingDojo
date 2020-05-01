USE twitter;

CREATE TABLE images (
id INT NOT NULL AUTO_INCREMENT, 
location TEXT,
user_id INT,
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES users(id));

INSERT INTO images (location, user_id) VALUES ('https://pro2-bar-s3-cdn-cf1.myportfolio.com/88d648e2c40bb444fd164d4ebcdde569/29625580-4d95-4af5-a825-c7d8c30aea0e.png?h=3f82ef7006a64136403ba08dc13a2e08', 3);

SELECT * FROM users JOIN images ON users.id = images.user_id;

UPDATE images SET user_id=2 WHERE user_id = 3;

DELETE FROM images WHERE user_id = 2;

DROP TABLE images;