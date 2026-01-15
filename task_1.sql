
-- Добавляем жанры
INSERT INTO genres(name)
VALUES
('Rap'),
('Jazz'),
('Rock');

-- Добавляем артистов
INSERT INTO artists(name)
VALUES
('Louis Armstrong'),
('Eminem'),
('Queen') ,
('AC/DC'),
('Nina Simone'),
('Snoop Dogg'),
('Порнофильмы'),
('Morgenstern'),
('Oxxxymiron');


-- Связываем артистов с жанрами
INSERT INTO genres_artists (genre_id, artist_id)
SELECT g.id, ar.id
FROM (VALUES
  ('Jazz', 'Louis Armstrong'),
  ('Jazz', 'Nina Simone'),

  ('Rap',  'Eminem'),
  ('Rap',  'Snoop Dogg'),
  ('Rap',  'Morgenstern'),
  ('Rap',  'Oxxxymiron'),

  ('Rock', 'Queen'),
  ('Rock', 'AC/DC'),
  ('Rock', 'Порнофильмы'),
  ('Rock', 'Morgenstern')
) AS links(genre_name, artist_name)
JOIN genres  g ON g.name = links.genre_name
JOIN artists ar ON ar.name = links.artist_name;



-- Добавляем альбомы
-- Альбомы Morgenstern 
INSERT INTO albums(name, release_date)
VALUES
('ALISHER', '2025-02-14'),
('Lollipop', '2020-09-04'),

-- Альбом Louis Armstrong 
('Louis Armstrong', '1968-01-01'),

-- Альбом Eminem 
('Curtain Call 2', '2022-08-05'),

-- Альбом Nina Simone 
('Feeling Good', '2021-06-10'),

-- Альбом Queen 
('A Night at the Opera', '1975-10-31'),

-- Альбом Snoop Dogg 
('BODR', '2022-02-11'),

-- Альбом AC/DC 
('Shot Down In Flames(Live)', '2019-08-04'),

-- Альбом Oxxxymiron 
('Красота и Уродство', '2021-12-01'),

-- Альбом Порнофильмы 
('Это пройдет', '2020-01-28');


-- Связываем альбомы с артистами
INSERT INTO albums_artists (album_id, artist_id)
SELECT al.id, ar.id
FROM (VALUES
  ('ALISHER', 'Morgenstern'),
  ('Lollipop', 'Morgenstern'),
  ('Louis Armstrong', 'Louis Armstrong'),
  ('Curtain Call 2', 'Eminem'),
  ('Feeling Good', 'Nina Simone'),
  ('A Night at the Opera', 'Queen'),
  ('BODR', 'Snoop Dogg'),
  ('Shot Down In Flames(Live)', 'AC/DC'),
  ('Красота и Уродство', 'Oxxxymiron'),
  ('Это пройдет', 'Порнофильмы')
) AS links(album_name, artist_name)
JOIN albums  al ON al.name = links.album_name
JOIN artists ar ON ar.name = links.artist_name;



-- Добавляем песни в альбомы
INSERT INTO songs (name, duration, album_id)
SELECT
    s.song_name,
    s.duration,
    al.id
FROM (
    VALUES
    -- Morgenstern
    ('КРАСНЫЙ ФЛАГ', 146, 'ALISHER'),
    ('ПОВОД', 154, 'ALISHER'),
    ('ПУСТОЙ ВОКЗАЛ', 153, 'ALISHER'),
    ('АНТИДЕПРЕССАНТЫ', 153, 'ALISHER'),
    ('Lollipop', 174, 'Lollipop'),

    -- Louis Armstrong
    ('Don''t Be That Way', 301, 'Louis Armstrong'),
    ('Makin''Whoopee', 239, 'Louis Armstrong'),
    ('They All Laughed', 230, 'Louis Armstrong'),
    ('Comes Love', 158, 'Louis Armstrong'),

    -- Eminem
    ('Godzilla', 211, 'Curtain Call 2'),
    ('Lucky You', 245, 'Curtain Call 2'),
    ('Lighters', 304, 'Curtain Call 2'),
    ('Rap God', 364, 'Curtain Call 2'),

    -- Nina Simone
    ('Feeling Good', 175, 'Feeling Good'),
    ('I Sing Just To Know That Im Alive', 154, 'Feeling Good'),
    ('Tomorrow Is My Turn', 175, 'Feeling Good'),

    -- Queen
    ('Bohemian Rhapsody', 356, 'A Night at the Opera'),
    ('You are My Best Friend', 173, 'A Night at the Opera'),
    ('I''m In Love With My Car', 185, 'A Night at the Opera'),
    ('Love Of My Life', 217, 'A Night at the Opera'),

    -- Snoop Dogg
    ('Still Smokin', 91, 'BODR'),
    ('Gun Smoke', 110, 'BODR'),

    -- AC/DC
    ('High Voltage', 357, 'Shot Down In Flames(Live)'),
    ('Live Wire', 397, 'Shot Down In Flames(Live)'),
    ('The Jack', 325, 'Shot Down In Flames(Live)'),
    ('Whole Lotta Rosie?Rocker', 845, 'Shot Down In Flames(Live)'),

    -- Oxxxymiron
    ('Хоп-механика', 138, 'Красота и Уродство'),
    ('Нон-фикшн', 215, 'Красота и Уродство'),
    ('Лифт', 275, 'Красота и Уродство'),
    ('Рецензия', 68, 'Красота и Уродство'),

    -- Порнофильмы
    ('Дядя Володя', 192, 'Это пройдет'),
    ('Нас догонит любовь', 228, 'Это пройдет'),
    ('Уроки любви', 317, 'Это пройдет')
) AS s(song_name, duration, album_name)
JOIN albums al ON al.name = s.album_name;


INSERT INTO collections(name, release_date)
-- Добавляем сборники
VALUES
('Лучшее 2020', '2020-12-31'),
('Legendary Rock', '2022-11-27'),
('Русский Рок', '2025-03-21'),
('Legendary Rap', '2023-07-18'),
('Вспомним Jazz', '2019-05-12'),
('Русский Рэп', '2024-12-18');


-- Добавляем песни в сборники
INSERT INTO songs_collections (song_id, collection_id)
SELECT
    s.id,
    c.id
FROM (
    VALUES
    -- Лучшее 2020
    ('Lollipop', 'Lollipop', 'Лучшее 2020'),
    ('Уроки любви', 'Это пройдет', 'Лучшее 2020'),

    -- Legendary Rock
    ('High Voltage', 'Shot Down In Flames(Live)', 'Legendary Rock'),
    ('Live Wire', 'Shot Down In Flames(Live)', 'Legendary Rock'),
    ('Уроки любви', 'Это пройдет', 'Legendary Rock'),
    ('Bohemian Rhapsody', 'A Night at the Opera', 'Legendary Rock'),
    ('Love Of My Life', 'A Night at the Opera', 'Legendary Rock'),

    -- Русский Рок
    ('Уроки любви', 'Это пройдет', 'Русский Рок'),
    ('ПОВОД', 'ALISHER', 'Русский Рок'),
    ('ПУСТОЙ ВОКЗАЛ', 'ALISHER', 'Русский Рок'),
    ('КРАСНЫЙ ФЛАГ', 'ALISHER', 'Русский Рок'),

    -- Legendary Rap
    ('Still Smokin', 'BODR', 'Legendary Rap'),
    ('Gun Smoke', 'BODR', 'Legendary Rap'),
    ('Godzilla', 'Curtain Call 2', 'Legendary Rap'),
    ('Lighters', 'Curtain Call 2', 'Legendary Rap'),

    -- Вспомним Jazz
    ('Feeling Good', 'Feeling Good', 'Вспомним Jazz'),
    ('Tomorrow Is My Turn', 'Feeling Good', 'Вспомним Jazz'),
    ('Don''t Be That Way', 'Louis Armstrong', 'Вспомним Jazz'),
    ('They All Laughed', 'Louis Armstrong', 'Вспомним Jazz'),
    ('Makin''Whoopee', 'Louis Armstrong', 'Вспомним Jazz'),

    -- Русский Рэп
    ('Хоп-механика', 'Красота и Уродство', 'Русский Рэп'),
    ('Нон-фикшн', 'Красота и Уродство', 'Русский Рэп'),
    ('Lollipop', 'Lollipop', 'Русский Рэп')
) AS links(song_name, album_name, collection_name)
-- Проверяем к какому альбому принадлежит песня
JOIN albums a
  ON a.name = links.album_name
JOIN songs s
  ON s.name = links.song_name
 AND s.album_id = a.id
JOIN collections c
  ON c.name = links.collection_name;
