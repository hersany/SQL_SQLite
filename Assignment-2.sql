SELECT AlbumId, COUNT (TrackId) AS Tracks
FROM tracks
GROUP BY AlbumId
ORDER BY Tracks DESC;

SELECT a.title, t.name
FROM albums AS a
JOIN tracks AS t
ON a.AlbumId = t.AlbumId;

SELECT t.name, t.AlbumId, a.title, MIN(t.Milliseconds) AS Duration
FROM albums AS a
JOIN tracks AS t
ON a.AlbumId = t.AlbumId
GROUP BY a.Title
ORDER BY Duration DESC;

SELECT t.name, a.AlbumId, a.Title, SUM(t.Milliseconds) AS Duration
FROM tracks AS t
JOIN albums AS a
ON t.AlbumId = a.AlbumId
GROUP BY a.title
ORDER BY Duration DESC;

SELECT a.Title, SUM(t.Milliseconds) AS Duration
FROM tracks AS t
JOIN albums AS a
ON t.AlbumId = a.AlbumId
GROUP BY a.title
HAVING Duration > 4200000;
