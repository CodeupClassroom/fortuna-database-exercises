USE codeup_test_db;

-- # Write SELECT statements for:
-- Albums released after 1991
SELECT * FROM albums
WHERE release_date > '1991';


-- Albums with the genre 'disco'
SELECT * FROM albums
WHERE genre = 'Disco';

SELECT * FROM albums
WHERE genre LIKE '%disco%';


-- Albums by 'Whitney Houston' (...or maybe an artist of your choice)
-- will not work!
SELECT * FROM albums
WHERE artist = 'Whitney Houston';



SELECT * FROM albums
WHERE artist LIKE '%whitney houston%';


-- # DELETEs

DELETE FROM albums
WHERE release_date > '1991';

DELETE FROM albums
WHERE genre = 'Disco';

DELETE FROM albums
WHERE artist LIKE '%whitney houston%';


SELECT * FROM albums;

