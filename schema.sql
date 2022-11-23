create TABLE genre (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  items text[],
);

create TABLE book (
  id INT PRIMARY KEY NOT NULL,
  publish_date DATE,
  publisher varchar(100),
  cover_state varchar(100)
);

create TABLE label (
  id INT PRIMARY KEY NOT NULL,
  title varchar(100),
  color varchar(20),
  items text[],
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
