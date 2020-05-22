CREATE OR REPLACE FUNCTION check_c() 
RETURNS TRIGGER AS $$
BEGIN
	IF ((SELECT s.year 
		FROM studios s, cartoons c
		WHERE c.studio = s.id AND c.id = new.id) <= new.year)
	THEN RETURN NEW; 
	ELSE RAISE EXCEPTION 'Неправильный год';
	END IF;
END;
$$
LANGUAGE plpgSQL;

CREATE TRIGGER cartoon_check
AFTER INSERT OR UPDATE ON cartoons
FOR EACH ROW EXECUTE PROCEDURE check_c();

-- DROP TRIGGER cartoon_check on cartoons;