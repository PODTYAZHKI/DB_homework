CREATE TABLE studios(
	id NUMERIC(6) CHECK (id > 0) PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	locality VARCHAR(40) NOT NULL,
	index NUMERIC(6) CHECK (index > 0) NOT NULL,
	address VARCHAR(40) NOT NULL,
	year NUMERIC(6) CHECK (year >= 1922 AND year <= 1991) NOT NULL,
	phone NUMERIC(11) NOT NULL
);

CREATE TABLE workers(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	surname VARCHAR(40) NOT NULL,
	patronymic VARCHAR(40),
	birth DATE CHECK(EXTRACT(YEAR FROM birth) <= (EXTRACT(YEAR FROM NOW()) - 16)) NOT NULL
);

CREATE TABLE genres(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	genre VARCHAR(40) NOT NULL
);

CREATE TABLE positions(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	position VARCHAR(40) NOT NULL
);

CREATE TABLE characters(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	note VARCHAR(120)
);

CREATE TABLE workers_phone(
	actor NUMERIC(5) REFERENCES workers,
	phone NUMERIC(11) CHECK (phone > 0) NOT NULL
);

CREATE TABLE cartoons(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	studio NUMERIC(5) REFERENCES studios,
	name VARCHAR(40) NOT NULL,
	year NUMERIC(4) CHECK (year <= 1991) NOT NULL 
	
);

CREATE TABLE series(
	nomder NUMERIC(4) UNIQUE CHECK (nomder > 0) NOT NULL,
	cartoon NUMERIC(5) REFERENCES cartoons,
	season NUMERIC(2) CHECK (season > 0) NOT NULL,
	name VARCHAR(40) NOT NULL,
	length NUMERIC(5) CHECK (length > 0) NOT NULL,
	release DATE NOT NULL,
	PRIMARY KEY(nomder, cartoon, season)
);

CREATE TABLE genres_of_cartoons(
	cartoon NUMERIC(5) REFERENCES cartoons,
	genre NUMERIC(5) REFERENCES genres
);

CREATE TABLE position_in_series(
	episode NUMERIC(4) REFERENCES series(nomder),
	worker NUMERIC(5) REFERENCES workers,
	position VARCHAR(40) NOT NULL
);

CREATE TABLE voices_of_characters(
	episode NUMERIC(4) REFERENCES series(nomder),
	character NUMERIC(5) REFERENCES characters,
	actor NUMERIC(5) REFERENCES workers
);