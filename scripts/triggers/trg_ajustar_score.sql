DELIMITER $$

CREATE TRIGGER trg_ajustar_score_manutencao
AFTER UPDATE ON tbl_manutencao
FOR EACH ROW
BEGIN
    IF OLD.fk_id_tipo_manutencao <> NEW.fk_id_tipo_manutencao THEN
        UPDATE tbl_veiculo 
        SET score = GREATEST(0.00, score - (SELECT valor_score FROM tbl_tipo_manutencao WHERE id = OLD.fk_id_tipo_manutencao))
        WHERE id = OLD.fk_id_veiculo;

        UPDATE tbl_veiculo 
        SET score = LEAST(100.00, score + (SELECT valor_score FROM tbl_tipo_manutencao WHERE id = NEW.fk_id_tipo_manutencao))
        WHERE id = NEW.fk_id_veiculo;
    END IF;
END$$

DELIMITER ;