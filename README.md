# Car-Assist Database
![Status](https://img.shields.io/badge/Status-em%20desenvolvimento-orange)
![SQL](https://img.shields.io/badge/SQL-025E8C)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)
![Car-Assist Logo](assets/car_assist_db.png)

Empresa especializada no desenvolvimento de aplicações voltadas para o setor automotivo, com foco na gestão, monitoramento e manutenção de veículos.

## Repositório

- [Principal](https://github.com/Bre01cc/Car-Assist)

## Sobre

Este repositório é destinado ao gerenciamento do banco de dados da aplicação **Car Assist**. Nele estão concentrados os modelos conceituais e lógicos do sistema, além dos scripts SQL responsáveis pela criação, atualização e populamento do banco de dados.

## Pré-requisitos

Antes de utilizar os scripts do projeto, é necessário possuir as seguintes ferramentas instaladas na máquina:

### Tecnologias utilizadas

| Tecnologia | Versão |
|------------|--------|
| MySQL | 8.0+ |
| MySQL Workbench | 8.0+ |
| Git | -- |

## Instalação

Siga os passos abaixo para configurar o projeto localmente:

#### 1 - Clonar o repositório

```
git clone https://github.com/nikolasfernnds/car-assist-database.git
```
#### 2 - Acessar a pasta do projeto
```
cd Car-Assist-database
```

## Executando os Scripts
#### 1 - Criação de tabelas
```
source scripts/create_tables.sql;
```
#### 2 - Inserts
```
source scripts/insert_sample_data.sql;
```
#### 3 - Views
```
```
---

## Estrutura do Projeto

- 📁 `models/`
  - 📁 `conceptual/`
  - 📁 `logical/`

- 📁 `scripts/`
  - 📄 `create_tables.sql`
  - 📄 `insert_sample_data.sql`
  - 📄 `update_schema.sql`

## Descrição das Pastas
### models/conceptual

Contém o modelo conceitual do banco de dados, representando as entidades, relacionamentos e regras de negócio do sistema.

### models/logical

Armazena o modelo lógico do banco de dados, contendo a estrutura detalhada das tabelas, atributos e relacionamentos.

### scripts

Diretório responsável pelos scripts SQL utilizados para criação, inserção de dados, manutenção e atualização do banco de dados.

## Autores
- [@Breno Reis](https://github.com/Bre01cc)
- [@Guilherme Moreira](https://github.com/Guilherme1108)
- [@Gustavo Mathias](https://github.com/Gustaxsx)
- [@Nikolas](https://github.com/nikolasfernnds)
