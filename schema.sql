create TABLE genre (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  items text[],
);

create TABLE music_albums (
  id INT PRIMARY KEY NOT NULL,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  genre_id INT REFERENCES genre(id),
)

create TABLE book (
  publisher varchar(100),
  cover_state varchar(100)
);

CREATE TABLE author(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name  VARCHAR(100)
);

CREATE TABLE game(
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    archived     BOOLEAN,
    multiplayer  BOOLEAN,
    last_played_at DATE,
    author_id      INTEGER REFERENCES author (id)
);
