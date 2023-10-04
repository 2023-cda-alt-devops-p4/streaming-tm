DELIMITER //

CREATE TRIGGER ArchiveUserUpdate
AFTER UPDATE ON Users

FOR EACH ROW
BEGIN

    IF OLD.firstname <> NEW.firstname THEN     

        INSERT INTO Archives (columnName, updatedAt, oldValue, newValue, Id_Users)
        VALUES ('firstname', NOW(), OLD.firstname, NEW.firstname, NEW.Id_Users);

    ELSEIF OLD.lastname <> NEW.lastname THEN
    
        INSERT INTO Archives (columnName, updatedAt, oldValue, newValue, Id_Users)
        VALUES ('lastname', NOW(), OLD.lastname, NEW.lastname, NEW.Id_Users);

    ELSEIF OLD.email <> NEW.email THEN

        INSERT INTO Archives (columnName, updatedAt, oldValue, newValue, Id_Users)
        VALUES ('email', NOW(), OLD.email, NEW.email, NEW.Id_Users);

    END IF;

END 

// DELIMITER ;