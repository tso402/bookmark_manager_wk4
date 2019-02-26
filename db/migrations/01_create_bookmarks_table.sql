CREATE DATABASE bookmark_manager;
\c bookmark_manager;
CREATE TABLE "bookmarks" ("id" SERIAL PRIMARY KEY, "url" VARCHAR(60));

INSERT INTO bookmarks(id,url)
VALUES
(1,'http://www.makersacademy.com'),
(2,'http://askjeeves.com'),
(3,'http://twitter.com'),
(4,'http://www.google.com');

DELETE FROM bookmarks
WHERE url = 'http://twitter.com';

UPDATE bookmarks
SET url = 'http://www.destroyallsoftware.com'
WHERE
url = 'http://askjeeves.com';
