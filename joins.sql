SELECT * from artist;

SELECT * FROM favorite_song;

--inner join

-- left table (FROM clause)
-- right table (JOIN clause)

SELECT *
from artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

SELECT *
from favorite_song
INNER JOIN artist
ON favorite_song.artist_id = artist.artist_id;

SELECT song_name, album, artist_name
from artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

SELECT song_name, album, artist_name
from favorite_song --err!  

SELECT song_name, album, artist_id
from favorite_song 

SELECT artist_name
from artist
WHERE artist_id = 2;

-- left join

SELECT song_name, album, artist_name
from artist
LEFT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;


-- left join, REVERSED!
SELECT song_name, album, artist_name
from favorite_song
LEFT JOIN artist
ON favorite_song.artist_id = artist.artist_id;

-- right join

SELECT song_name, album, artist_name
from artist
RIGHT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;


-- full join

SELECT song_name, album, artist_name
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;


-- exploring ambiguity with select statement
SELECT song_name, album, artist_name, favorite_song.artist_id
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;


-- not necessary but you could specify these too!
SELECT favorite_song.song_name, favorite_song.album, artist.artist_name, favorite_song.artist_id
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;


-- alias
SELECT song_name, album, artist_name, f_s.artist_id
from artist
FULL JOIN favorite_song AS f_s
ON f_s.artist_id = artist.artist_id;


SELECT song_name, artist_name, album
from artist AS a
FULL JOIN favorite_song AS f_s
ON f_s.artist_id = a.artist_id
WHERE song_name LIKE 'H%'
ORDER BY artist_name DESC




