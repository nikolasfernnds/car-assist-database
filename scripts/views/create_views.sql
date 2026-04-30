USE `car_assist_database`;

CREATE OR REPLACE VIEW vw_resumo_veiculo AS
SELECT 
    v.placa,
    v.modelo,
    v.score,
    u.nome AS proprietario,
    COALESCE(SUM(g.valor), 0) AS total_gasto
FROM tbl_veiculo v
JOIN tbl_usuario_veiculo uv ON v.id = uv.fk_id_veiculo
JOIN tbl_usuario u ON u.id = uv.fk_id_usuario
LEFT JOIN tbl_gastos g ON v.id = g.fk_id_veiculo AND g.is_ativo = 1
WHERE v.is_ativo = 1 AND u.is_ativo = 1
GROUP BY v.id, u.id;

CREATE OR REPLACE VIEW vw_historico_manutencao AS
SELECT 
    m.id AS manutencao_id,
    v.placa,
    v.modelo,
    tm.nome AS tipo_manutencao,
    m.data_manutencao,
    m.custo,
    m.quilometragem,
    m.oficina,
    u.nome AS realizado_por
FROM tbl_manutencao m
JOIN tbl_veiculo v ON m.fk_id_veiculo = v.id
JOIN tbl_tipo_manutencao tm ON m.fk_id_tipo_manutencao = tm.id
JOIN tbl_usuario u ON m.fk_id_usuario = u.id
WHERE m.is_ativo = 1;

CREATE OR REPLACE VIEW vw_servicos_localizacao AS
SELECT 
    s.nome_local,
    s.tipo_estabelecimento,
    ts.nome AS categoria_servico,
    e.logradouro,
    e.cep,
    e.Complemento, 
    s.latitude,
    s.longitude
FROM tbl_servicos s
JOIN tbl_tipo_servico ts ON s.fk_id_tipo_servico = ts.id
LEFT JOIN tbl_enderecos e ON s.id = e.fk_id_servico; 