
--Task 4
--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT al.name
FROM albums al
JOIN albums_artists aa ON aa.album_id = al.id
JOIN genres_artists ga ON ga.artist_id = aa.artist_id
GROUP BY al.id, al.name
HAVING COUNT(DISTINCT ga.genre_id) > 1;

--Наименования треков, которые не входят в сборники.
SELECT s.name
FROM songs s
LEFT JOIN songs_collections sc ON sc.song_id = s.id
WHERE sc.song_id IS NULL;

--Исполнители с самыми короткими треками
SELECT DISTINCT ar.name
FROM songs s
JOIN albums a ON a.id = s.album_id
JOIN albums_artists aa ON aa.album_id = a.id
JOIN artists ar ON ar.id = aa.artist_id
WHERE s.duration = (
    SELECT MIN(duration)
    FROM songs
);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.name
FROM albums a
JOIN songs s ON s.album_id = a.id
GROUP BY a.id, a.name
HAVING COUNT(s.id) = (
    SELECT COUNT(s2.id)
    FROM songs s2
    GROUP BY s2.album_id
    ORDER BY COUNT(s2.id)
    LIMIT 1
);