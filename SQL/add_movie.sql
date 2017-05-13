DELIMITER $$

DROP PROCEDURE IF EXISTS `add_movie`;
CREATE PROCEDURE `add_movie`(

	-- Movie Arguments
	IN movie_title VARCHAR(100),
	IN movie_year INT,
	IN movie_director VARCHAR(100),
	IN movie_banner_url VARCHAR(200),
	IN movie_trailer_url VARCHAR(200),

	-- Star field values
	IN star_first_name VARCHAR(50),
	IN star_last_name VARCHAR(50),
	IN star_dob DATE,
	in star_photo_url VARCHAR(200),

	-- Genre values
	IN genre_name VARCHAR(32),

	-- Outputs a status message
	OUT out_message VARCHAR(128)

)
	BEGIN

		DECLARE movie_id INT;
		DECLARE genre_id INT;
		DECLARE star_id INT;

		-- If a movie already exists by title, do not allow duplicates.
		SELECT id INTO movie_id FROM movies WHERE movies.title LIKE movie_title LIMIT 1;
		IF (SELECT movie_id IS NOT NULL)
		THEN

			-- Movie exists, do nothing.
			SET out_message := CONCAT('ERROR: A movie already exists with that title, ID: ', movie_id);

		ELSE

			-- Make sure the provided genre is valid.
			SELECT id INTO genre_id FROM genres WHERE genres.name LIKE genre_name LIMIT 1;
			IF (SELECT genre_id IS NULL)
			THEN
				INSERT INTO genres (genres.name) VALUE (genre_name);
				SET genre_id = LAST_INSERT_ID();
			END IF;

			-- Make sure the provided star is valid.
			SELECT id INTO star_id FROM stars WHERE stars.first_name LIKE star_first_name AND stars.last_name LIKE star_last_name LIMIT 1;
			IF (SELECT star_id IS NULL)
			THEN
				INSERT INTO stars (first_name, last_name, dob, photo_url) VALUE (star_first_name, star_last_name, star_dob, star_photo_url);
				SET star_id = LAST_INSERT_ID();
			END IF;

			-- Create the relevant rows for a movie entry.
			INSERT INTO movies (title, year, director, banner_url, trailer_url) VALUE (movie_title, movie_year, movie_director, movie_banner_url, movie_trailer_url);
			SET movie_id = LAST_INSERT_ID();
			INSERT INTO genres_in_movies (genre_id, movie_id) VALUE (genre_id, movie_id);
			INSERT INTO stars_in_movies (star_id, movie_id) VALUE (star_id, movie_id);

			SET out_message := 'Successfully created all fields.';

		END IF;

	END
$$

DELIMITER ;