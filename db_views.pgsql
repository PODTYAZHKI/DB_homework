-- CREATE OR REPLACE VIEW number_of_cartoons_in_each_studio AS
-- 	SELECT 
-- 		s.name AS Studios,
-- 		COUNT(c.*) AS number_of_cartoons
-- 	FROM cartoons c, studios s
-- 	WHERE c.studio = s.id
-- 	GROUP BY s.name;

DROP VIEW number_of_cartoons_in_each_studio;
