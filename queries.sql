-- Query all of the entries in the Genre table
SELECT * FROM 'Genre';

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into 'Artist' values (null, 'Sufjan Stevens', 2003);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into 'Album' values (null, 'Michican', 2003, 2000, 'A label', 29, 15);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into 'Song' values (null, 'They Also Mourn Who Do Not Wear Black', 300, 2003, 15, 29, 24);
INSERT into 'Song' values (null, 'Say Yes!  To M!chigan!', 250, 2003, 15, 29, 24);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.
-- Disclaimer: this is janky.  It was my first attempt
SELECT *
FROM Album
LEFT JOIN Song
ON Album.AlbumId = Song.AlbumId
WHERE Song.SongId NOTNULL
AND Album.Title = 'Michigan';

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;


-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select *, count(song.title)
from album, song
where album.albumid = song.albumid
group by album.albumid;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select *, count(song.title)
from artist, song
where artist.artistid = song.artistid
group by artist.artistid;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select *, count(song.songid)
from genre, song
where genre.genreid = song.genreid
group by genre.genreid;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select title, albumlength
from album
where albumlength =
	(select max(albumlength) from album);

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select title, songlength
from song
where songlength = (select max(songlength) from song)

-- Modify the previous query to also display the title of the album.
select song.title, songlength, album.title
from song, album
where song.albumid = album.albumid
and songlength = (select max(songlength) from song)























-- In class examples
-- All customers who have ordered something
SELECT firstName, lastName, amount
FROM customers c, orders o
ON c.id = o.customerId

-- All customers, whether or not they've ordered anything
SELECT firstName, lastName, orderDate
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerId

-- All customers who have not ordered anything
SELECT firstName, lastName, orderDate, amount
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerId
WHERE orderDate is NULL

-- Music History get artist id dynamically in your insert
INSERT INTO album
VALUES (null, 'Bears and Beetz', ...,
	(SELECT artistId from artist where artistName = 'Billy Beetz')
	(SELECT genreId from genre where label = 'Latin'))

-- how many songs exist for each artist?
SELECT artist.artistName as rocker
COUNT(song.title) AS '# of tracks'
FROM artist, song
ON artist.artistid = song.artistId
GROUP BY artist.artistname

-- how many songs exist for each genre
SELECT genre.label AS genre
COUNT(song.title) AS '# of tracks'
FROM genre, song
ON genre.genreid = song.genreId
GROUP BY genre.label

-- longest song
SELECT title, MAX(song.length)
FROM album

-- same query, with album and song title
SELECT album.title, song.title, MAX(songlength)
from song
join album
on song.albumid = album.albumid






























