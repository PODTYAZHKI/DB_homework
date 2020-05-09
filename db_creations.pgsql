CREATE TABLE studios(
	id numeric(6) CHECK (id > 0) PRIMARY KEY,
	st_name VARCHAR(40) NOT NULL,
	locality VARCHAR(40) NOT NULL,
	st_index NUMERIC(6) CHECK (index > 0) NOT NULL,
	address VARCHAR(40) NOT NULL,
	st_year NUMERIC(6) CHECK (year < EXTRACT(YEAR FROM NOW())) NOT NULL,
	phone NUMERIC(11) NOT NULL
);

CREATE TABLE workers(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	w_name VARCHAR(40) NOT NULL,
	surname VARCHAR(40) NOT NULL,
	patronymic VARCHAR(40),
	birth DATE CHECK(EXTRACT(YEAR FROM birth) <= (EXTRACT(YEAR FROM NOW()) - 16) NOT NULL
);

CREATE TABLE genres(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	genre VARCHAR(40) NOT NULL
);

CREATE TABLE positions(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	p_position VARCHAR(40) NOT NULL
);

CREATE TABLE characters(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	ch_name VARCHAR(40) NOT NULL,
	note VARCHAR(120)
);

CREATE TABLE worker_phone(
	actor NUMERIC(5) REFERENCES workers,
	phone NUMERIC(11) NOT NULL
);

CREATE TABLE cartoons(
	id NUMERIC(5) CHECK (id > 0) PRIMARY KEY,
	studio NUMERIC(5) REFERENCES studios,
	c_name VARCHAR(40) NOT NULL,
	c_year NUMERIC(4) NOT NULL
	
);

CREATE TABLE series(
	nomder NUMERIC(4) CHECK (nomder > 0) NOT NULL,
	cartoon NUMERIC(5) REFERENCES cartoons,
	season NUMERIC(2) NOT NULL,
	s_name VARCHAR(40) NOT NULL,
	length NUMERIC(5) CHECK (length > 0) NOT NULL,
	s_release DATE NOT NULL,
	PRIMARY KEY(nomder, cartoon, season)
);

CREATE TABLE genres_of_cartoons(
	cartoon NUMERIC(5) REFERENCES cartoons,
	genre NUMERIC(5) REFERENCES genre
);

CREATE TABLE position_in_series(
	episode NUMERIC(5) REFERENCES series,
	worker NUMERIC(5) REFERENCES workers,
	p_position VARCHAR(40) NOT NULL
);

CREATE TABLE voices_of_characters(
	episode NUMERIC(5) REFERENCES series,
	v_character NUMERIC(5) REFERENCES characters,
	actor NUMERIC(5) REFERENCES workers
);