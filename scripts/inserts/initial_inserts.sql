SET FOREIGN_KEY_CHECKS = 0;

-- USUÁRIOS
INSERT INTO tbl_usuario (id, nome, email, cpf, data_nascimento, senha) VALUES 
(1, 'Nikolas Fernandes', 'nikolas.fernandes@email.com', '10110110110', '2006-05-10', '1234'),
(2, 'Marta Silva', 'marta.silva@email.com', '12345678901', '1985-10-12', '1234'),
(3, 'Everton Santos', 'everton.santos@email.com', '98765432100', '1990-05-20', '1234');

-- TIPOS DE MANUTENÇÃO
INSERT INTO tbl_tipo_manutencao (id, nome, valor_score, descricao) VALUES 
(1, 'Troca de Óleo', 10, 'Substituição preventiva de óleo e filtro'),
(2, 'Revisão de Freios', 15, 'Troca de pastilhas e fluídos'),
(3, 'Alinhamento/Balanceamento', 5, 'Ajuste de geometria'),
(4, 'Revisão Completa', 30, 'Check-up geral'),
(5, 'Manutenção Corretiva', 2, 'Conserto de avarias');

-- VEÍCULOS (SCORE 100.00 PADRÃO)
INSERT INTO tbl_veiculo (id, placa, modelo, cor, score, ano, is_ativo) VALUES 
(1, 'NIK2006', 'Civic G10', 'PRETO', 100.00, 2020, TRUE),
(2, 'ABC1D23', 'Onix Turbo', 'BRANCO', 100.00, 2022, TRUE),
(3, 'XYZ9K88', 'Corolla XRE', 'PRATA', 100.00, 2019, TRUE);

-- VÍNCULO USUÁRIO-VEÍCULO
INSERT INTO tbl_usuario_veiculo (fk_id_usuario, fk_id_veiculo, papel_usuario) VALUES 
(1, 1, 'Proprietário'),
(2, 2, 'Proprietário'),
(3, 3, 'Proprietário');

-- SERVIÇOS
INSERT INTO tbl_tipo_servico (id, nome) VALUES (1, 'Mecânica'), (2, 'Auto Elétrica'), (3, 'Abastecimento');

INSERT INTO tbl_servicos (id, nome_local, tipo_estabelecimento, endereco, latitude, longitude, fk_id_tipo_servico) VALUES 
(1, 'Oficina do Juninho', 'Oficina', 'Rua das Oficinas, 123', -23.5505, -46.6333, 1),
(2, 'Eletro Car', 'Elétrica', 'Av. da Tecnologia, 400', -23.5510, -46.6340, 2);

-- GASTOS E MANUTENÇÕES
INSERT INTO tbl_categoria_gasto (id, nome_categoria) VALUES (1, 'Combustível'), (2, 'Manutenção'), (3, 'Impostos');

INSERT INTO tbl_gastos (tipo_gasto, data_gasto, valor, fk_id_veiculo, fk_id_categoria) VALUES 
('Gasolina', '2026-04-30', 250.00, 1, 1),
('Troca de Lâmpada', '2026-05-01', 45.00, 1, 2);

INSERT INTO tbl_manutencao (data_manutencao, custo, quilometragem, oficina, fk_id_tipo_manutencao, fk_id_usuario, fk_id_veiculo) VALUES 
('2026-05-02 10:00:00', 350.00, 45000, 'Oficina do Juninho', 1, 1, 1);

-- LEMBRETES
INSERT INTO tbl_lembretes (titulo, tipo_alerta, data_vencimento, status, fk_id_veiculo) VALUES 
('Renovar Seguro', 'Push', '2026-12-20 08:00:00', 'PENDENTE', 1),
('Rodízio de Pneus', 'Email', '2026-06-15 09:00:00', 'PENDENTE', 1);

SET FOREIGN_KEY_CHECKS = 1;