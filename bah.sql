CREATE DATABASE IF NOT EXISTS BD_milium;
USE BD_milium;


CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(100),
    Sexo CHAR(1),
    Data_Nasc DATE,
    RG VARCHAR(20)
);
DESCRIBE Cliente;


CREATE TABLE Endereco (
    Id_Endereco INT PRIMARY KEY,
    Cod_Cliente INT,
    Rua VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    Estado VARCHAR(2),
    CEP VARCHAR(10),
    FOREIGN KEY (Cod_Cliente) REFERENCES Cliente(Id_Cliente)
);
DESCRIBE Endereco;


CREATE TABLE Telefone (
    Id_Tel INT PRIMARY KEY,
    Cod_Cliente INT,
    Numero VARCHAR(15),
    FOREIGN KEY (Cod_Cliente) REFERENCES Cliente(Id_Cliente)
);
DESCRIBE Telefone;


CREATE TABLE Produto (
    Id_Produto INT PRIMARY KEY,
    Nome_Prod VARCHAR(100),
    Marca VARCHAR(50),
    Modelo VARCHAR(50)
);
DESCRIBE Produto;


CREATE TABLE Venda (
    Id_Venda INT PRIMARY KEY,
    Cod_Produto INT,
    Cod_Cliente INT,
    Data_Venda DATE,
    Quantidade INT,
    Valor DECIMAL(10,2),
    FOREIGN KEY (Cod_Produto) REFERENCES Produto(Id_Produto),
    FOREIGN KEY (Cod_Cliente) REFERENCES Cliente(Id_Cliente)
);
DESCRIBE Venda;

