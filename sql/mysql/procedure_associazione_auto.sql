DROP PROCEDURE IF EXISTS ASSOCIAZIONE_AUTO;
DELIMITER $$
CREATE PROCEDURE ASSOCIAZIONE_AUTO(
    In_user_id INT,
    In_targa VARCHAR(7),
    In_modello VARCHAR(20),
    In_device VARCHAR(11)
)
MODIFIES SQL DATA
BEGIN
    START TRANSACTION;

    INSERT INTO AUTOMOBILI (Targa, Modello) VALUES (In_targa, In_modello);
    INSERT INTO APPARTENENZE_AUTO (Automobile, Cliente) VALUES (In_targa, In_user_id);
    INSERT INTO ASSOCIAZIONI_DISP_AUTO (Dispositivo, Automobile) VALUES (In_device, In_targa);

    COMMIT;
END $$

DELIMITER ;