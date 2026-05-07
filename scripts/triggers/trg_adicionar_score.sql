DELIMITER $$

CREATE TRIGGER trg_adicionar_score_manutencao
AFTER INSERT ON tbl_manutencao
FOR EACH ROW
BEGIN
    UPDATE tbl_veiculo 
    SET score = LEAST(100.00, score + (SELECT valor_score FROM tbl_tipo_manutencao WHERE id = NEW.fk_id_tipo_manutencao))
    WHERE id = NEW.fk_id_veiculo;
END$$

DELIMITER ;