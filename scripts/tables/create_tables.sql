CREATE VIEW vw_servicos AS
SELECT
    servico.id,
    servico.nome_local,
    servico.latitude,
    servico.longitude,
    tipo_servico.id id_tipo_servico,
    tipo_servico.nome
FROM tbl_servicos servico
JOIN tbl_tipo_servico tipo_servico ON tipo_servico.id = servico.fk_id_tipo_servico;

CREATE VIEW vw_endereco AS
SELECT
    endereco.id,
    endereco.logradouro,
    endereco.cep,
    endereco.complemento,
    servico.id id_servico,
    servico.nome_local
FROM tbl_enderecos endereco
JOIN tbl_servicos servico ON servico.id = endereco.fk_id_servico;

CREATE VIEW vw_lembretes AS
SELECT
    lembrete.id,
    lembrete.titulo,
    lembrete.descricao,
    lembrete.data_criacao,
    lembrete.data_vencimento,
    lembrete.status,
    veiculo.id id_veiculo,
    veiculo.modelo
FROM tbl_lembretes lembrete
JOIN tbl_veiculo veiculo ON lembrete.fk_id_veiculo = veiculo.id;

CREATE VIEW vw_gastos AS
SELECT
    gasto.id,
    gasto.data_gasto,
    gasto.valor,
    veiculo.id id_veiculo,
    veiculo.modelo,
    categoria_gasto.id id_categoria_gasto,
    categoria_gasto.nome_categoria
FROM tbl_gastos gasto
JOIN tbl_veiculo veiculo ON gasto.fk_id_veiculo = veiculo.id
JOIN tbl_categoria_gasto categoria_gasto ON gasto.fk_id_categoria = categoria_gasto.id;

CREATE VIEW vw_manutencao AS
SELECT
    manutencao.id,
    manutencao.data_manutencao,
    manutencao.custo,
    manutencao.quilometragem,
    manutencao.oficina,
    manutencao.observacoes,
    manutencao.is_ativo,
    tipo_manutencao.id AS id_tipo_manutencao,
    tipo_manutencao.nome AS nome_tipo_manutencao,
    usuario.id AS id_usuario,
    usuario.nome AS nome_usuario,
    veiculo.id AS id_veiculo,
    veiculo.modelo,
    evidencia.id AS id_evidencia,
    evidencia.url
FROM tbl_manutencao manutencao
JOIN tbl_tipo_manutencao tipo_manutencao ON manutencao.fk_id_tipo_manutencao = tipo_manutencao.id
JOIN tbl_usuario usuario ON manutencao.fk_id_usuario = usuario.id
JOIN tbl_veiculo veiculo ON manutencao.fk_id_veiculo = veiculo.id
LEFT JOIN tbl_evidencia evidencia ON evidencia.fk_id_manutencao = manutencao.id;

CREATE VIEW vw_usuario_veiculo AS
SELECT
    usuario.id,
    usuario.nome,
    usuario.cpf,
    usuario.email,
    usuario.data_nascimento,
    usuario.senha,
    usuario.foto_usuario,
    usuario.is_ativo,
    veiculo.id id_veiculo,
    veiculo.modelo,
    veiculo.placa,
    uv.papel_usuario,
    uv.data_vinculo
FROM tbl_usuario usuario
LEFT JOIN tbl_usuario_veiculo uv ON usuario.id = uv.fk_id_usuario
LEFT JOIN tbl_veiculo veiculo ON uv.fk_id_veiculo = veiculo.id;

CREATE VIEW vw_chatbot AS
SELECT
    chatbot.id,
    chatbot.pergunta,
    chatbot.resposta,
    chatbot.data_interacao,
    usuario.id id_usuario,
    usuario.nome nome_usuario
FROM tbl_chatbot chatbot
JOIN tbl_usuario usuario ON chatbot.fk_id_usuario = usuario.id;

CREATE VIEW vw_usuario_servicos AS
SELECT
    usuario.id id_usuario,
    usuario.nome nome_usuario,
    servico.id id_servico,
    servico.nome_local,
    tipo_servico.nome tipo_servico
FROM tbl_usuario_servico usu_serv
JOIN tbl_usuario usuario ON usu_serv.fk_id_usuario = usuario.id
JOIN tbl_servicos servico ON usu_serv.fk_id_servicos = servico.id
JOIN tbl_tipo_servico tipo_servico ON servico.fk_id_tipo_servico = tipo_servico.id;

CREATE VIEW vw_manutencao_pecas AS
SELECT
    manutencao.id id_manutencao,
    manutencao.data_manutencao,
    peca.id id_peca,
    peca.nome nome_peca,
    veiculo.modelo
FROM tbl_manutencao_peca mp
JOIN tbl_manutencao manutencao ON mp.fk_id_manutencao = manutencao.id
JOIN tbl_pecas peca ON mp.fk_id_peca = peca.id
JOIN tbl_veiculo veiculo ON manutencao.fk_id_veiculo = veiculo.id;

SELECT * FROM vw_gastos;
SELECT * FROM vw_servicos;
SELECT * FROM vw_usuario_veiculo;
SELECT * FROM vw_chatbot;
SELECT * FROM vw_usuario_servicos;
SELECT * FROM vw_manutencao_pecas;