DELIMITER $$

CREATE TRIGGER trg_validar_proprietario
BEFORE INSERT ON tbl_usuario_veiculo
FOR EACH ROW
BEGIN
    IF NEW.papel_usuario = 'Proprietário' AND EXISTS (
        SELECT 1 FROM tbl_usuario_veiculo 
        WHERE fk_id_veiculo = NEW.fk_id_veiculo 
        AND papel_usuario = 'Proprietário'
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Este veículo já possui um proprietário vinculado.';
    END IF;
END$$

DELIMITER ;