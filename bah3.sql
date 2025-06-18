CREATE DATABASE locadora;

USE locadora;

-- Criação das tabelas
CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_cli VARCHAR(100),
    sexo CHAR(1),
    data_nasc DATE,
    rg VARCHAR(20),
    cpf VARCHAR(20),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE endereco (
    id_endereco INT NOT NULL AUTO_INCREMENT,
    cod_cliente INT, -- Coluna adicionada para vincular ao cliente
    rua VARCHAR(100),
    num_casa VARCHAR(30),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    cep VARCHAR(50),
    PRIMARY KEY(id_endereco)
);

CREATE TABLE telefone (
    id_tel INT NOT NULL AUTO_INCREMENT,
    cod_cliente INT, -- Coluna adicionada para vincular ao cliente
    numero_tel VARCHAR(50),
    PRIMARY KEY(id_tel)
);

CREATE TABLE veiculo (
    id_veiculo INT NOT NULL AUTO_INCREMENT,
    nome_car VARCHAR(100),
    modelo VARCHAR(100),
    fabricante VARCHAR(50),
    data_fab DATE,
    cor VARCHAR(50),
    placa VARCHAR(15),
    PRIMARY KEY(id_veiculo)
);

CREATE TABLE atendente (
    id_atende INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    PRIMARY KEY(id_atende)
);

CREATE TABLE contrato (
    id_contrato INT NOT NULL AUTO_INCREMENT,
    nome_contrato VARCHAR(100),
    cod_cliente INT,
    cod_atende INT,
    cod_veiculo INT,
    preco FLOAT,
    data_aluguel DATE,
    PRIMARY KEY(id_contrato)
);

CREATE TABLE manutencao (
    id_manutencao INT NOT NULL AUTO_INCREMENT,
    servico VARCHAR(100),
    cod_veiculo INT,
    valor_reparo FLOAT,
    PRIMARY KEY(id_manutencao)
);

---

### Inserção de Dados de Exemplo

INSERT INTO cliente (nome_cli, sexo, data_nasc, rg, cpf) VALUES
("Macario Jose", "M", "2000-11-30", "1234569", "12378989"),
("Nicolly", "F", "2008-12-05", "12954569", "15718989");

-- Inserir dados na tabela endereco (corrigido)
INSERT INTO endereco (cod_cliente, rua, num_casa, bairro, cidade, estado, cep) VALUES
(1, "rua amor perfeito", "02", "jardim esperança", "Paranaguá", "Paraná", "12345-210"),
(2, "rua amor perfeito", "03", "jardim esperança", "Paranaguá", "Paraná", "12345-210");

-- Inserir dados na tabela telefone
INSERT INTO telefone (cod_cliente, numero_tel) VALUES
(1, "41998765432"),
(2, "41991234567");

-- Inserir dados na tabela atendente
INSERT INTO atendente (nome) VALUES
('eu amo ela'),
('nicolly');

-- Inserir dados na tabela veiculo
INSERT INTO veiculo (nome_car, modelo, fabricante, data_fab, cor, placa) VALUES
('Onix', 'Plus', 'Chevrolet', '2022-05-10', 'Prata', 'ABC-1234'),
('HB20', 'Vision', 'Hyundai', '2023-01-15', 'Branco', 'DEF-5678');

-Inserir dados na tabela contrato

INSERT INTO contrato (nome_contrato, cod_cliente, cod_atende, cod_veiculo, preco, data_aluguel) VALUES
('Aluguel Simples', 1, 1, 1, 150.00, '2025-05-28'),

('Aluguel Executivo', 2, 2, 2, 250.00, '2025-05-29');

Inserir dados na tabela manutencao
INSERT INTO manutencao (servico, cod_veiculo, valor_reparo) VALUES
('Troca de óleo', 1, 80.00),
('Alinhamento e Balanceamento', 2, 120.00);


-- Adicionar chave estrangeira em endereco (corrigido o parêntese)
ALTER TABLE endereco
ADD FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente);

-- Adicionar chave estrangeira em telefone
ALTER TABLE telefone
ADD FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente);

-- Adicionar chaves estrangeiras em contrato
ALTER TABLE contrato
ADD FOREIGN KEY (cod_cliente) REFERENCES cliente(id_cliente),
ADD FOREIGN KEY (cod_atende) REFERENCES atendente(id_atende),
ADD FOREIGN KEY (cod_veiculo) REFERENCES veiculo(id_veiculo);

-- Adicionar chave estrangeira em manutencao
ALTER TABLE manutencao
ADD FOREIGN KEY (cod_veiculo) REFERENCES veiculo(id_veiculo);