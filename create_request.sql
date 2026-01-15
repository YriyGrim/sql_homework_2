CREATE TABLE Genres(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE Artists(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE Albums(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_date DATE NOT NULL
);


CREATE TABLE Songs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration INT NOT NULL CHECK (duration > 0),
	album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE Collections(
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_date DATE NOT NULL
);

CREATE TABLE Songs_Collections(
	song_id INT NOT NULL,
	collection_id INT NOT NULL,
	
	CONSTRAINT songs_collections 
		PRIMARY KEY (song_id, collection_id),
		
	FOREIGN KEY (song_id) REFERENCES Songs(id),
    FOREIGN KEY (collection_id) REFERENCES Collections(id)
);

CREATE TABLE Genres_Artists(
	genre_id INT NOT NULL,
	artist_id INT NOT NULL,
	
	CONSTRAINT pk_genres_artists 
		PRIMARY KEY (genre_id, artist_id),
		
	FOREIGN KEY (genre_id) REFERENCES Genres(id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id)	
);

CREATE TABLE Albums_Artists(
	album_id INT NOT NULL,
    artist_id INT NOT NULL,

    CONSTRAINT pk_albums_artists
        PRIMARY KEY (album_id, artist_id),

    FOREIGN KEY (album_id) REFERENCES Albums(id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id)
);


