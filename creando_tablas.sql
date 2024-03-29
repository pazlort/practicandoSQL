CREATE TABLE movies(
   id INTEGER PRIMARY KEY,
   name TEXT DEFAULT NULL,
   year INTEGER DEFAULT NULL,
   rank REAL DEFAULT NULL
);

CREATE TABLE actors(
    id INTEGER PRIMARY KEY,
    first_name TEXT DEFAULT NULL,
    last_name TEXT DEFAULT NULL,
    gender TEXT DEFAULT NULL
);

CREATE TABLE roles(
    actor_id INTEGER,
    movie_id INTEGER,
    role_name TEXT DEFAULT NULL
);