DELIMITER //

CREATE TRIGGER ArchiveUserUpdate
AFTER UPDATE ON Users

FOR EACH ROW
BEGIN

    IF OLD.firstname <> NEW.firstname THEN     

        INSERT INTO Archives (columnName, updatedAt, oldValue, newValue)
        VALUES ('firstname', NOW(), OLD.firstname, NEW.firstname);

        INSERT INTO Updates (Id_Users, Id_Archives)
        VALUES (NEW.Id_Users, LAST_INSERT_ID());

    ELSEIF OLD.lastname <> NEW.lastname THEN
    
        INSERT INTO Archives (columnName, updatedAt, oldValue, newValue)
        VALUES ('lastname', NOW(), OLD.lastname, NEW.lastname);

        INSERT INTO Updates (Id_Users, Id_Archives)
        VALUES (NEW.Id_Users, LAST_INSERT_ID());

    ELSEIF OLD.email <> NEW.email THEN

        INSERT INTO Archives (columnName, updatedAt, oldValue, newValue)
        VALUES ('email', NOW(), OLD.email, NEW.email);

        INSERT INTO Updates (Id_Users, Id_Archives)
        VALUES (NEW.Id_Users, LAST_INSERT_ID());

    END IF;

END 

// DELIMITER ;