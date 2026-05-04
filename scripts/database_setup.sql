CREATE DATABASE IF NOT EXISTS `car_assist_database` DEFAULT CHARACTER SET utf8mb4;

USE `car_assist_database`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS tbl_usuario_veiculo, tbl_usuario_servico, tbl_enderecos, 
                   tbl_manutencao, tbl_gastos, tbl_lembretes, tbl_chatbot, 
                   tbl_servicos, tbl_veiculo, tbl_categoria_gasto, 
                   tbl_tipo_servico, tbl_tipo_manutencao, tbl_usuario;
SET FOREIGN_KEY_CHECKS = 1;

