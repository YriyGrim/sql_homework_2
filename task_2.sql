--Task 2
--Название и продолжительность самого длительного трека
SELECT name, duration
FROM songs
ORDER BY duration DESC
LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут
SELECT name, duration
FROM songs
WHERE duration>=210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM collections
WHERE release_date BETWEEN '2018-01-10' AND '2020-12-31';

--Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM artists
WHERE LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) + 1 = 1;

--Название треков, которые содержат слово «мой» или «my». Спасибо, что подсказали и дали ссылки на ресурсы!!!
--Вариант 1
SELECT name
FROM songs
WHERE string_to_array(lower(name), ' ') && ARRAY['my', 'мой'];

--Вариант 2
SELECT name
FROM songs
WHERE name ~* '\y(my|мой)\y';