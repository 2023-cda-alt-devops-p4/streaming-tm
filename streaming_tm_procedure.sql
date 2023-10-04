DELIMITER //

CREATE PROCEDURE findMoviesByDirector(IN director_name VARCHAR(50))
BEGIN
    DECLARE result VARCHAR(255);

    SELECT m.title
    FROM Movies m
    JOIN Directors d ON m.Id_Directors = d.Id_Directors
    WHERE d.firstname = director_name OR d.lastname = director_name
    INTO result;
END 

// DELIMITER ;
