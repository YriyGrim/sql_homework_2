--Task 3
--Количество исполнителей в каждом жанре
SELECT g.name, COUNT(ga.artist_id)
FROM genres_artists ga
JOIN genres g ON g.id = ga.genre_id
GROUP BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(s.id) AS total_songs
FROM songs s
JOIN albums a ON a.id = s.album_id
WHERE a.release_date BETWEEN '2019-01-01' AND '2020-12-31';


--Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(sc.duration) AS avg_duration
FROM songs sc
JOIN albums a ON a.id = sc.album_id
GROUP BY a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT ar.name
FROM artists ar
WHERE NOT EXISTS (
    SELECT *
    FROM albums_artists aa
    JOIN albums al ON al.id = aa.album_id
    WHERE aa.artist_id = ar.id
      AND al.release_date BETWEEN '2020-01-01' AND '2020-12-31'
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT c.name
FROM collections c
JOIN songs_collections sc ON sc.collection_id = c.id
JOIN songs s ON s.id = sc.song_id
JOIN albums a ON a.id = s.album_id
JOIN albums_artists aa ON aa.album_id = a.id
JOIN artists ar ON ar.id = aa.artist_id
WHERE ar.name = 'Morgenstern';