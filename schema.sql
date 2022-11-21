create TABLE genre (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  items text[],
);

create TABLE book (
  publisher varchar(100),
  cover_state varchar(100)
);

